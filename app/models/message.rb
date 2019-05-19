class Message < ApplicationRecord
  belongs_to :user
  validates_presence_of :votes
  validates :body, presence: true, length: { maximum: 140 }
end
