class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.float :price
      t.string :material_type
      t.string :size
      t.string :color

      t.references :band
      t.references :category
      t.timestamps
    end
  end
end
