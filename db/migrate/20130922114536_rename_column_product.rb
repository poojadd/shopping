class RenameColumnProduct < ActiveRecord::Migration
  def up
    rename_column(:products, :band_id, :brand_id)
  end

  def down
    rename_column(:products, :brand_id, :band_id)
  end
end
