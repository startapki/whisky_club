class CreateKinds < ActiveRecord::Migration[5.0]
  def change
    create_table :kinds do |t|
      t.text :name

      t.timestamps
    end
  end
end
