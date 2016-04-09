class CreateAttributeValues < ActiveRecord::Migration[5.0]
  def change
    create_table :attribute_values do |t|
      t.references :item, foreign_key: true
      t.references :attribute_kind, foreign_key: true
      t.references :possible_value, foreign_key: true
      t.text :value

      t.timestamps
    end
  end
end
