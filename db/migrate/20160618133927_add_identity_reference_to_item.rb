class AddIdentityReferenceToItem < ActiveRecord::Migration[5.0]
  def change
    change_table :items do |t|
      t.references :items_identity, null: true, index: true, foreign_key: true
    end
  end
end
