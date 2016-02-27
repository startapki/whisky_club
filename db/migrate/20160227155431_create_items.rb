class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.text :title
      t.text :description
      t.references :user, foreign_key: true
      t.integer :position

      t.timestamps
    end
  end
end
