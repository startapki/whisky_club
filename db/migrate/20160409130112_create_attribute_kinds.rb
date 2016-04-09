class CreateAttributeKinds < ActiveRecord::Migration[5.0]
  def change
    create_table :attribute_kinds do |t|
      t.string :name
      t.references :kind, foreign_key: true
      t.integer :attribute_meta, default: 0

      t.timestamps
    end
  end
end
