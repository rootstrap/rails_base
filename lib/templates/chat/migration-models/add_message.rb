class AddMessage < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.belongs_to :user
      t.belongs_to :chat
      t.string   	 :content
      t.string   	 :image
      t.integer  	 :image_orientation
      t.string   	 :message_type
      t.boolean  	 :sent
      t.boolean  	 :read
      t.timestamps
    end
  end
end
