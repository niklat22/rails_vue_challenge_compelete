class Project < ApplicationRecord
  belongs_to :manager, optional: true
  has_and_belongs_to_many :users

  validates :name, presence: true, length: { minimum: 2 }
end
