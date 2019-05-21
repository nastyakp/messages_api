# frozen_string_literal: true

# message model
class Message < ApplicationRecord
  belongs_to :user
  validates_presence_of :votes
  validates :body, presence: true, length: { maximum: 140 }

  scope :most_voted_week, -> { most_voted(Time.now - 1.week) }
  scope :most_voted_day,  -> { most_voted(Time.now - 1.day) }

  def self.most_voted(from_date = false)
    # idea: to add variable "how_may" to choose not only 5 most voted
    if from_date
      where('messages.created_at > ?', from_date)
        .select('DISTINCT user_id, votes, body, created_at').group(:user_id, :votes, :body, :created_at)
        .order('votes DESC').limit(5)
    else
      select('DISTINCT user_id, votes, body').group(:user_id, :votes, :body)
                                             .order('votes DESC').limit(5)
    end
  end
end