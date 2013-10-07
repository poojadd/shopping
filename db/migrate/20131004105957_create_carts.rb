class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.references :users
      t.references :products
      t.timestamps
    end
  end
end
