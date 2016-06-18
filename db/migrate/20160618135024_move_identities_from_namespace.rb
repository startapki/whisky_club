class MoveIdentitiesFromNamespace < ActiveRecord::Migration[5.0]
  def change
    rename_table :items_identities, :identities
  end
end
