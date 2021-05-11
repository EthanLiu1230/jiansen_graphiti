class AddParentIdNameIndexToCategory < ActiveRecord::Migration[6.1]
  def change
    add_index :categories, [:parent_id, :name], unique: true
  end
end
