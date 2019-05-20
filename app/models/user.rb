# frozen_string_literal: true

# user model
class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  include DeviseTokenAuth::Concerns::User

  validates_presence_of :nickname
  has_many :messages, dependent: :destroy

  scope :most_messages, lambda {
                          left_joins(:messages)
                            .group(:id)
                            .order('count(messages.user_id)  DESC')
                            .limit(5)
                        }
  scope :most_messages_week, lambda {
                               left_joins(:messages)
                                 .where('messages.created_at > ?', Time.now - 1.week)
                                 .group(:id).order('count(messages.user_id)  DESC')
                                 .limit(5)
                             }
  scope :most_messages_day, lambda {
                              left_joins(:messages)
                                .where('messages.created_at > ?', Time.now - 1.day)
                                .group(:id)
                                .order('count(messages.user_id)  DESC')
                                .limit(5)
                            }
  scope :most_popular, lambda {
                         left_joins(:messages)
                           .group(:id)
                           .order('sum(messages.votes)/count(messages.user_id) DESC')
                           .limit(5)
                       }
  scope :most_popular_week, lambda {
                              left_joins(:messages)
                                .where('messages.created_at > ?', Time.now - 1.week)
                                .group(:id).order('sum(messages.votes)/count(messages.user_id) DESC')
                                .limit(5)
                            }
  scope :most_popular_day, lambda {
                             left_joins(:messages)
                               .where('messages.created_at > ?', Time.now - 1.day)
                               .group(:id)
                               .order('sum(messages.votes)/count(messages.user_id) DESC')
                               .limit(5)
                           }
end
