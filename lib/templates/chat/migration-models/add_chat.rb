class AddChat < ActiveRecord::Migration[5.0]
  def change
    create_table :chat do |t|
      t.string  :name
      t.string  :last_message
      t.boolean :seen_data
      t.timestamps
    end
  end
end
