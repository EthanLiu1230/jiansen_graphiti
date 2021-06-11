class AddColumnsToContent < ActiveRecord::Migration[6.1]
  def change
    add_column :contents, :subtitle, :string
    add_column :contents, :body, :text
    add_reference :contents, :page, null: true, foreign_key: true
    add_column :contents, :name, :string
    add_index :contents, [:name, :page_id], unique: true
  end
end
