class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.string :subject, null: false
      t.text :text
      t.string :emails, array: true, null: false, default: []

      t.timestamps null: false
    end
  end
end
