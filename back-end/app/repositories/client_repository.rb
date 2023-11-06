module Repositories
  class ClientRepository
    def read_all
      Client.all
    end

    def get(client_id)
      Client.find(client_id)
    end
  end
end
