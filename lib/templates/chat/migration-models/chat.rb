class Chat < ApplicationRecord
  has_many :participants
  has_many :messages
  has_many :users, through: :participants
  has_many :user_messages, through: :messages, source: :users

  validates :name, presence: true
  validates :users?

  def mark_user_seen(user)
    participants.find_by_user(user).update_column(:seen_data, true)
  end

  def users?
    erros.add(:base, 'A chat must have at least two users') if users.length < 2
  end
end
