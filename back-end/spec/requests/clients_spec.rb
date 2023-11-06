require 'rails_helper'

RSpec.describe 'Clients', type: :request do
  describe 'GET /clients' do
    before do
      create_list(:client, 10)
      get '/clients'
    end

    it 'returns all clients' do
      expect(json.size).to eq(10)
    end

    it "has the proper data" do
      client = json[0]

      expect(client["client_name"]).to be_present
      expect(client["client_id"]).to be_present
      expect(client["vote_count"]).to be_present
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end
end
