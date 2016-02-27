class AddImageToItems < ActiveRecord::Migration[5.0]
  def change
    change_table :items do |t|
      t.integer :image
    end
  end
end
