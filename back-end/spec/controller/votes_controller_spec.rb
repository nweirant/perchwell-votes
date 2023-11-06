require 'rails_helper'

RSpec.describe VotesController, type: :controller do
  let(:client_repo) { instance_double(Repositories::ClientRepository) }
  let(:vote_repo) { instance_double(Repositories::VoteRepository) }
  let(:number_of_votes) { 5 }
  let(:client) { create(:client) }
  let(:votes) { create_list(:vote, number_of_votes, client_id: client.id) }

  before do
    allow(Repositories::ClientRepository).to receive(:new).and_return(client_repo)
    allow(Repositories::VoteRepository).to receive(:new).and_return(vote_repo)
  end

  describe "#show" do
    context "on success" do
      before do
        allow(client_repo).to receive(:get).and_return(client)
        allow(vote_repo).to receive(:get).and_return(votes)
      end

      it "returns the vote count" do
        get :show, params: { id: client.id }

        expect(client_repo).to have_received(:get)
        expect(vote_repo).to have_received(:get)
        expect(response.parsed_body["vote_count"]).to eq number_of_votes
        expect(response).to be_successful
      end
    end

    context "when client does not exist" do
      before do
        allow(client_repo).to receive(:get).and_raise(ActiveRecord::RecordNotFound)
      end

      it "returns 404" do
        get :show, params: { id: 0 }

        expect(response.status).to eq 404
      end
    end
  end

  describe "#create" do
    context "on success" do
      before do
        allow(client_repo).to receive(:get).and_return(client)
        allow(vote_repo).to receive(:create).and_return(true)
        allow(vote_repo).to receive(:get).and_return(votes)

      end

      it "returns the vote count" do
        post :create, params: { id: client.id }

        expect(client_repo).to have_received(:get)
        expect(vote_repo).to have_received(:create)
        expect(response.parsed_body["vote_count"]).to eq number_of_votes
        expect(response).to be_successful
      end
    end

    context "when saving is not successfull" do
      before do
        allow(client_repo).to receive(:get).and_return(client)
        allow(vote_repo).to receive(:create).and_return(false)
        allow(vote_repo).to receive(:get).and_return(votes)

      end

      it "returns 500" do
        post :create, params: { id: client.id }

        expect(response.status).to eq 500
      end
    end
  end
end
