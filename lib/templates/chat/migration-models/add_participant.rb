class AddParticipant < ActiveRecord::Migration[5.0]
  def change
    create_table :participant do |t|
      t.belongs_to :user
      t.belongs_to :chat
      t.datetime	:last_connection
      t.string	:last_message_user
      t.timestamps

      add_index :message, [:user_id, :chat_id]
    end
  end
end
