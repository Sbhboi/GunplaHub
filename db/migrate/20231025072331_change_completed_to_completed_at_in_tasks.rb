class ChangeCompletedToCompletedAtInTasks < ActiveRecord::Migration[7.0]
  def change
    remove_column :tasks, :completed
    add_column :tasks, :completed_at, :datetime
  end
end
