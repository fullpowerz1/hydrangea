class CreatePictures < ActiveRecord::Migration[6.1]
  def change
    create_table :pictures do |t|
      t.integer :order_id,          null: false
      t.string :name,               null: false, default: ""
      t.text :introduction,         null: false
      t.integer :price,             null: false
      t.boolean :is_active,         null: false, default: true

      t.timestamps
    end
  end
end
