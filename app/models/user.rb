class User < ActiveRecord::Base
  has_many :projects
  has_many :languages, through: :projects
  has_many :tags, through: :projects

  def self.get_user_from_omniauth(auth_hash)
    self.find_with_omniauth(auth_hash) || self.create_with_omniauth(auth_hash)
  end

  def self.create_with_omniauth(auth_hash)
    # create(:uid => auth_hash[:uid], :name => auth_hash[:info][:name])
  end

  def self.find_with_omniauth(auth_hash)
    find_by(:uid => auth_hash[:uid])
  end

end
