class CreateItemsIdentities < ActiveRecord::Migration[5.0]
  def change
    create_table :items_identities do |t|
      t.string :provider
      t.string :name
      t.float :rating
      t.float :cost

      t.jsonb :classification, null: false, default: '{}'
      t.jsonb :location, null: false, default: '{}'
      t.jsonb :info, null: false, default: '{}'

      t.timestamps null: false
    end
  end
end
