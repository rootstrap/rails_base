class AddChat < ActiveRecord::Migration[5.0]
  def change
    create_table :chats do |t|
      t.string  :name
      t.string  :last_message
      t.timestamps
    end
  end
end
