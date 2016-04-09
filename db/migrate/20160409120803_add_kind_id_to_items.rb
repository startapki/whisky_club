class AddKindIdToItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :items, :kind, foreign_key: true
  end
end
