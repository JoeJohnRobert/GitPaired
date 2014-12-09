class User < ActiveRecord::Base 
  has_many :projects
  has_many :languages, through: :projects
  has_many :tags, through: :projects
  geocoded_by :zipcode
  after_validation :geocode
  # validates :zipcode, numericality: true
  # validates :zipcode, length: { is: 5 }
  attr_reader :proximity

# FOR GEOCODER
  def self.select_nearby_users(current_user, location, distance)
    coordinates = Geocoder.coordinates(location)
    lat, lng = coordinates
    @users_nearby = User.near([lat, lng], distance) # sets arr of users near queried zipcode
    @users_nearby = @users_nearby.select { |u| u.id != current_user.id } if current_user # eliminates current user
    @users_nearby.each {|u| u.proximity= (u.set_proximity_to(coordinates))}
    @users_nearby = @users_nearby.sort_by {|u| u.proximity}
  end

  def proximity= (distance)
    @proximity = distance
  end

  def set_proximity_to(coordinates)
    if self.geocoded?
      self.distance_from(coordinates)
    end
  end
  
  def get_neighborhood
    Geocoder.search(self.zipcode).first.data["address_components"][1]["long_name"]
  end


# FOR OMNIAUTH
  def self.get_user_from_omniauth(auth_hash)
    self.find_with_omniauth(auth_hash) || self.create_with_omniauth(auth_hash)
  end

  def self.find_with_omniauth(auth_hash)
    find_by(:uid => auth_hash[:uid])
  end

  def self.create_with_omniauth(auth_hash)
    @full_name_arr = auth_hash[:info][:name].split
    User.create(
      :uid => auth_hash[:uid],
      :image_path => auth_hash[:info][:image],
      :first_name => @full_name_arr[0],
      :last_name => @full_name_arr[1],
      :email => auth_hash[:info][:email],
      :gh_url => auth_hash[:info][:urls][:GitHub],
      :blog_url => auth_hash[:info][:urls][:Blog],
      :gh_username => auth_hash[:extra][:raw_info][:login],
      :repos_url => auth_hash[:extra][:raw_info][:repos_url],
      :public_repos => auth_hash[:extra][:raw_info][:public_repos],
      :followers => auth_hash[:extra][:raw_info][:followers],
      :following => auth_hash[:extra][:raw_info][:following],
      :gh_created_at => auth_hash[:extra][:raw_info][:created_at]
    )
  end

  def create_or_update_projects(repos)
    repos.each do |repo|
      unless self.projects.find_by(:name => repo[:name])
        self.projects.create(:name => repo[:name])
      end
      
      self.projects.find_by(:name => repo[:name]).update(
        :name => repo['name'],
        :archive_url => repo['archive_url'].gsub("/{archive_format}{/ref}", "").gsub("api.", "").gsub("repos/", ""),
        :description => repo['description'],
        :pushed_at => repo['pushed_at'],
        :language => repo['language'],
        :watchers_count => repo['watchers_count'],
        :tags_url => repo['tags_url'],
        :contributors_url => repo['contributors_url'],
        :collaborators_url => repo['collaborators_url']
      )
    end
  end

  def sort_projects_by_push
    self.projects.sort_by{|proj| proj.pushed_at}
  end

  def collab_wanted
    self.projects.map{|proj| proj.collaborator_wanted}
  end


  def all_projects
    self.projects.select do |project|
      project.language && project.recent?
    end
  end

  def most_common_language
    languages = self.projects.map {|proj| proj.language} - [nil]
    languages.group_by {|lang| lang}.values.max_by(&:size).first
  end

  def add_languages
    projects = self.all_projects
    languages = projects.collect {|p| p.language}.join(" ")
  end

end
