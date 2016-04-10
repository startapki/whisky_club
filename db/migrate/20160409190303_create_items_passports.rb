class CreateItemsPassports < ActiveRecord::Migration[5.0]
  def change
    create_table :items_passports do |t|
      t.references :item, null: false, foreign_key: true
      t.references :identity, null: false, index: true

      t.timestamps null: false
    end

    add_index :items_passports, [:item_id, :identity_id], unique: true
    add_foreign_key :items_passports, :items_identities, column: :identity_id
  end
end
