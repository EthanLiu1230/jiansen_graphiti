class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.belongs_to :category, null: true, foreign_key: true

      t.timestamps
    end
    add_index :products, :name, unique: true
  end
end
