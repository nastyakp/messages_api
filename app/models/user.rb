# frozen_string_literal: true

# user model
class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  include DeviseTokenAuth::Concerns::User

  validates_presence_of :nickname
  has_many :messages, dependent: :destroy

  scope :most_messages_week, -> { most_messages(Time.now - 1.week) }
  scope :most_messages_day,  -> { most_messages(Time.now - 1.day) }
  scope :most_popular_week,  -> { most_popular(Time.now - 1.week) }
  scope :most_popular_day,   -> { most_popular(Time.now - 1.day) }

  def self.most_popular(from_date = false)
    if from_date
      left_joins(:messages).where('messages.created_at > ?', from_date)
                           .group(:id).order('sum(messages.votes)/count(messages.user_id) DESC')
                           .limit(5)
    else
      left_joins(:messages).group(:id)
                           .order('sum(messages.votes)/count(messages.user_id) DESC')
                           .limit(5)
    end
  end

  def self.most_messages(from_date = false)
    if from_date
      left_joins(:messages).where('messages.created_at > ?', from_date)
                           .group(:id).order('count(messages.user_id)  DESC')
                           .limit(5)
    else
      left_joins(:messages).group(:id)
                           .order('count(messages.user_id)  DESC')
                           .limit(5)
    end
  end
end
