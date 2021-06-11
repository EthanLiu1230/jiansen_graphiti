class CreatePages < ActiveRecord::Migration[6.1]
  def change
    create_table :pages do |t|
      t.string :path

      t.timestamps
    end
    add_index :pages, :path, unique: true
  end
end
