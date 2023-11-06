require_relative "../repositories/client_repository.rb"
require_relative "../repositories/vote_repository.rb"

module Utils
  def client_repo
    @client_repo ||= Repositories::ClientRepository.new
  end

  def vote_repo
    @vote_repo ||= Repositories::VoteRepository.new
  end
end
