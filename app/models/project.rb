class Project < ActiveRecord::Base
  has_many :languages
  has_many :tags
  belongs_to :user
end
