# frozen_string_literal: true

class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  include DeviseTokenAuth::Concerns::User

  validates_presence_of :nickname
  has_many :messages, dependent: :destroy

end
