# frozen_string_literal: true

# message model
class Message < ApplicationRecord
  belongs_to :user
  validates_presence_of :votes
  validates :body, presence: true, length: { maximum: 140 }

  scope :most_voted, lambda {
                       select('DISTINCT user_id, votes, body')
                         .group(:user_id, :votes, :body)
                         .order('votes DESC')
                         .limit(5)
                     }
  scope :most_voted_week, lambda {
                            where('messages.created_at > ?', Time.now - 1.week)
                              .select('DISTINCT user_id, votes, body')
                              .group(:user_id, :votes, :body).order('votes DESC')
                              .limit(5)
                          }
  scope :most_voted_day, lambda {
                           where('messages.created_at > ?', Time.now - 1.day)
                             .select('DISTINCT user_id, votes, body')
                             .group(:user_id, :votes, :body)
                             .order('votes DESC')
                             .limit(5)
                         }
end
