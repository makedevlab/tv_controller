class MakeRoutineAndChoreRelated < ActiveRecord::Migration[5.2]
  def change
    remove_column :chores, :name, :string
    add_column :chores, :routine_id, :task_id
  end
end
