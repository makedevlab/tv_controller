class ChangeChoreCompleteDefaultToTrue < ActiveRecord::Migration[5.2]
  def change
    change_column_default :chores, :complete, from: nil, to: false
  end
end
