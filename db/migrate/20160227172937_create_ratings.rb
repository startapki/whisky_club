class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.integer :value
      t.text :comment

      t.references :user, foreign_key: true, null: false
      t.references :item, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
