class DropItemsPassports < ActiveRecord::Migration[5.0]
  def change
    drop_table :items_passports
  end
end
