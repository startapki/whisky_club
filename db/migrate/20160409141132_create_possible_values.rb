class CreatePossibleValues < ActiveRecord::Migration[5.0]
  def change
    create_table :possible_values do |t|
      t.string :value
      t.references :attribute_kind, foreign_key: true

      t.timestamps
    end
  end
end
