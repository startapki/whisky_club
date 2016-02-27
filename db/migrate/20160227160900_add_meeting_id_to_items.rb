class AddMeetingIdToItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :items, :meeting, foreign_key: true
    remove_column :items, :user_id
  end
end
