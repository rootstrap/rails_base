# == Schema Information
#
# Table name: chats
#
#  id           :integer          not null, primary key
#  name         :string
#  last_message :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Chat < ApplicationRecord
  has_many :participants
  has_many :messages
  has_many :users, through: :participants
  has_many :authors_messages, through: :messages, source: :users

  validates :name, presence: true
  validate :users?

  def mark_user_seen(user)
    participants.find_by(user: user).update_column(:seen_data, true)
  end

  private

  def users?
    errors.add(:base, 'A chat must have at least two users') if users.length < 2
  end
end
