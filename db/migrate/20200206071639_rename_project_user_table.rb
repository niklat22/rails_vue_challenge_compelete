class RenameProjectUserTable < ActiveRecord::Migration[6.0]
  def change
    rename_table :project_users, :projects_users
  end
end
