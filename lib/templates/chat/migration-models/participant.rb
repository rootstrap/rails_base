# == Schema Information
#
# Table name: participants
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  chat_id           :integer
#  last_connection   :datetime
#  last_message_user :string
#  seen_data         :boolean
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_participants_on_chat_id  (chat_id)
#  index_participants_on_user_id  (user_id)
#

class Participant < ApplicationRecord
  belongs_to :chat
  belongs_to :user

  validates :user, uniqueness: { scope: :chat }

  # Please add conversation statistics or useful data here,
  # instead of fetching all the messages and re process eveytime
end
