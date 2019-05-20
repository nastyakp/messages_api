# frozen_string_literal: true

class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :configure_permitted_parameters, if: :devise_controller?

  def stats
    @allways = {}
    @allways[:most_mess] =   User.left_joins(:messages).group(:id).order('count(messages.user_id)  DESC').limit(5)
    @allways[:most_voted] =  Message.select('DISTINCT user_id, votes, body').group(:user_id, :votes, :body).order('votes DESC').limit(5)
    @allways[:most_popular] = User.left_joins(:messages).group(:id).order("sum(messages.votes)/count(messages.user_id) DESC").limit(5)

    @week = {}
    @week[:most_mess] =      User.left_joins(:messages).where('messages.created_at > ?', Time.now - 1.week)
                                 .group(:id).order('count(messages.user_id)  DESC').limit(5)
    @week[:most_voted] =     Message.where('messages.created_at > ?', Time.now - 1.week).select('DISTINCT user_id, votes, body')
                                    .group(:user_id, :votes, :body).order('votes DESC').limit(5)
    @week[:most_popular] =   User.left_joins(:messages).where('messages.created_at > ?', Time.now - 1.week)
                                 .group(:id).order("sum(messages.votes)/count(messages.user_id) DESC").limit(5)


    @today = {}
    @today[:most_mess] =     User.left_joins(:messages).where('messages.created_at > ?', Time.now - 1.day)
                                  .group(:id).order('count(messages.user_id)  DESC').limit(5)
    @today[:most_voted] =    Message.where('messages.created_at > ?', Time.now - 1.day).select('DISTINCT user_id, votes, body')
                                    .group(:user_id, :votes, :body).order('votes DESC').limit(5)
    @today[:most_popular] =   User.left_joins(:messages).where('messages.created_at > ?', Time.now - 1.day)
                                 .group(:id).order("sum(messages.votes)/count(messages.user_id) DESC").limit(5)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
end
