class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :manager_id
      t.timestamps
      
      t.index :manager_id
    end
  end
end
