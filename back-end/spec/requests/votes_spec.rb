require 'rails_helper'

RSpec.describe 'Votes', type: :request do
  describe 'GET /votes/:id' do
    let(:client) { create(:client) }

    before do
      create(:vote, client_id: client.id)
      get "/votes/#{client.id}"
    end

    it "has the proper data" do
      expect(json["client_name"]).to eq client.name
      expect(json["client_id"]).to eq client.id
      expect(json["vote_count"]).to eq 1
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /votes/:id' do
    let(:client) { create(:client) }

    it "increases the number of votes" do
      expect(Vote.where(client_id: client.id).count).to eq 0
      post "/votes/#{client.id}"
      expect(Vote.where(client_id: client.id).count).to eq 1
    end

    it "has the proper data" do
      post "/votes/#{client.id}"
      expect(json["client_name"]).to eq client.name
      expect(json["client_id"]).to eq client.id
      expect(json["vote_count"]).to eq 1
    end

    it 'returns status code 200' do
      post "/votes/#{client.id}"
      expect(response).to have_http_status(:success)
    end
  end
end
