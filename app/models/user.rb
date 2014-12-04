
class User < ActiveRecord::Base
  has_many :projects
  has_many :languages, through: :projects
  has_many :tags, through: :projects

  def self.get_user_from_omniauth(auth_hash)
    self.find_with_omniauth(auth_hash) || self.create_with_omniauth(auth_hash)
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
        :archive_url => repo['archive_url'],
        :pushed_at => repo['pushed_at'],
        :language => repo['language'],
        :watchers_count => repo['watchers_count'],
        :tags_url => repo['tags_url'],
        :contributors_url => repo['contributors_url'],
        :collaborators_url => repo['collaborators_url']
      )
    end
  end

  def self.find_with_omniauth(auth_hash)
    find_by(:uid => auth_hash[:uid])
  end

  def get_neighborhood
    zipcode = self.location
    Geocoder.search(zipcode).first.data["address_components"][1]["long_name"]
  end

end
