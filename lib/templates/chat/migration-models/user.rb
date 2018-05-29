  has_many :participants
  has_many :chats, through: :participants
  has_many :messages