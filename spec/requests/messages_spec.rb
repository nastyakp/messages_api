# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Messages API', type: :request do
  let!(:user) { create(:user) }
  let!(:messages) { create_list(:message, 10) }
  let(:message_id) { messages.first.id }

  describe 'GET /messages' do
    before { get '/messages.json' }

    it 'returns all messages' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /messages' do

    context 'when the request has valid JWT' do
      context 'and request is valid' do
        let(:valid_attributes) { { body: 'body message', user_id: user.id } }
        sign_in(:user)
        before { post '/messages', params: valid_attributes }

        it 'creates a message' do
          expect(json['body']).to eq('body message')
        end

        it 'returns status code 201' do
          expect(response).to have_http_status(201)
        end
      end

      context 'but request is invalid' do
        sign_in(:user)
        before { post '/messages', params: { body: 'Foobar' } }

        it 'returns status code 422' do
          expect(response).to have_http_status(422)
        end

        it 'returns a validation failure message' do
          expect(json['user']).to eq(['must exist'])
        end
      end
    end
  end

  context 'when the request doesnt have valid JWT' do
    context 'and request is valid' do
      let(:valid_attributes) { { body: 'body message', user_id: user.id } }
      before { post '/messages', params: valid_attributes }

      it 'returns a unauthorized failure message' do
        expect(response.body).to eq('body message')
      end

      it 'returns status code 401' do
        expect(response).to have_http_status(401)
      end
    end
  end

  describe 'PUT /messages/:id' do
    context 'when the request has valid JWT' do
      sign_in(:user)
      before { put "/messages/#{message_id}" }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end

    context 'when the request doesnt have valid JWT' do
      before { put "/messages/#{message_id}" }

      it 'returns a unauthorized failure message' do
        expect(response.body).to eq('body message')
      end

      it 'returns status code 401' do
        expect(response).to have_http_status(401)
      end
    end
  end
end
