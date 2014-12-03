class User < ActiveRecord::Base
  has_many :projects
  has_many :languages, through: :projects
  has_many :tags, through: :projects
end
