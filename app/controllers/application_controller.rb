# frozen_string_literal: true

# app controller
class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :configure_permitted_parameters, if: :devise_controller?

  def stats
    @allways = {}
    @allways[:most_mess] =    User.most_messages
    @allways[:most_voted] =   Message.most_voted
    @allways[:most_popular] = User.most_popular

    @week = {}
    @week[:most_mess] =      User.most_messages_week
    @week[:most_voted] =     Message.most_voted_week
    @week[:most_popular] =   User.most_popular_week

    @today = {}
    @today[:most_mess] =     User.most_messages_day
    @today[:most_voted] =    Message.most_voted_day
    @today[:most_popular] =  User.most_popular_day
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
end
