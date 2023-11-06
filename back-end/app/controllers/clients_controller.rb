require_relative "../entities/client_entity.rb"

class ClientsController < ApplicationController
  include Utils

  def index
    all_clients = client_repo.read_all

    clients = all_clients.map do |client|
      Entities::ClientEntity.new(
        client_id: client.id,
        client_name: client.name,
        vote_count: vote_repo.get(client.id).count
      )
    end

    render json: clients
  end
end
