class RenameItemIdentity < ActiveRecord::Migration[5.0]
  def change
    rename_column :items, :items_identity_id, :identity_id
  end
end
