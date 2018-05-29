class AddParticipant < ActiveRecord::Migration[5.0]
  def change
    create_table :participants do |t|
      t.belongs_to :user
      t.belongs_to :chat
      t.datetime	:last_connection
      t.string	:last_message_user
      t.boolean :seen_data
      t.timestamps
    end
  end
end
