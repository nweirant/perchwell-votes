require_relative "../entities/client_entity.rb"

class VotesController < ApplicationController
  include Utils

  def show
    client = client_repo.get(params[:id])
    render json: Entities::ClientEntity.new(
      client_id: client.id,
      client_name: client.name,
      vote_count: vote_repo.get(client.id).count
    )

  rescue ActiveRecord::RecordNotFound
    render json: {
      error: "Client not found"
    }, status: 404
  end

  def create
    if vote_repo.create(params[:id])
      show
    else
      render json: {
        error: "Creating vote not successful.",
        details: "Client may not exist."
      }, status: 500
    end
  end
end
