class AddFieldToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :project_id, :integer, foreign_key: true
  end
end
