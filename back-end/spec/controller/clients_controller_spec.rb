require 'rails_helper'

RSpec.describe ClientsController, type: :controller do
  let(:client_repo) { instance_double(Repositories::ClientRepository) }
  let(:clients) { create_list(:client, 10) }

  before do
    allow(Repositories::ClientRepository).to receive(:new).and_return(client_repo)
    allow(client_repo).to receive(:read_all).and_return(clients)
  end

  describe "#index" do
    it "calls the clients repo" do
      get :index

      expect(client_repo).to have_received(:read_all)
      expect(response).to be_successful
    end

    it "returns a list of clients" do
      get :index

      expect(response.parsed_body.count).to eq 10
      expect(response).to be_successful
    end
  end
end
