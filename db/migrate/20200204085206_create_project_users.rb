class CreateProjectUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :projects_users do |t|
      t.integer :project_id
      t.integer :user_id
      t.timestamps

      t.index :project_id
    end

    add_index :projects_users, :user_id, unique: true
  end
end
