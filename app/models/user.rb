class User < ApplicationRecord
  has_many :managed_projects
  has_and_belongs_to_many :projects
end
