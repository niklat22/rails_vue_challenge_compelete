class ProjectUser < ActiveRecord::Base
  self.table_name = "projects_users"
  
  validates :project_id, presence: true
  validates :user_id, presence: true, uniqueness: { scope: :project_id }
end
