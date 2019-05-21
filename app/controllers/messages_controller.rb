# frozen_string_literal: true

# Controller 4 Messages
class MessagesController < ApplicationController
  before_action :authenticate_user!, only: %i[create update]
  def index
    @messages = Message.order('created_at DESC')
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    if @message.save
      render json: @message, status: :created
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  def update
    @message = Message.find(params[:id])
    @message.increment!(:votes, 1)
    head :no_content
  end

  private

  def message_params
    params.permit(:body)
  end
end
