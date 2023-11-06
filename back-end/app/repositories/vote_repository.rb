module Repositories
  class VoteRepository
    def get(client_id)
      Vote.where(client_id: client_id)
    end

    def create(client_id)
      vote = Vote.new(client_id: client_id)
      vote.save
    end
  end
end
