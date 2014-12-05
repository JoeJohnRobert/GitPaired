class Project < ActiveRecord::Base
  has_many :languages
  has_many :tags
  belongs_to :user

  # def create_or_update_projects(current_user)

  # end

end
