class ChangeRoutineToTask < ActiveRecord::Migration[5.2]
  def change
    rename_table :routines, :tasks
    rename_column :chores, :routine_id, :task_id
  end
end
