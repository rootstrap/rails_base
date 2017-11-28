class AddMessage < ActiveRecord::Migration[5.0]
  def change
    create_table :message do |t|
      t.belongs_to :user
      t.belongs_to :chat
      t.string   	 :content
      t.string   	 :image
      t.integer  	 :image_orientation
      t.string   	 :message_type
      t.boolean  	 :sent
      t.boolean  	 :read
      t.timestamps

      add_index :message, [:user_id, :chat_id]
    end
  end
end
