class Participant < ApplicationRecord
  belongs_to :chat
  belongs_to :user

  validates :user, uniqueness: { scope: :chat }

  # Please add conversation statistics or useful data here,
  # instead of fetching all the messages and re process eveytime
end
