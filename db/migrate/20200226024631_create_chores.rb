class CreateChores < ActiveRecord::Migration[5.2]
  def change
    create_table :chores do |t|
      t.integer :child_id
      t.string :name
      t.boolean :complete

      t.timestamps
    end
  end
end
