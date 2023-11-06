module Entities
  class ClientEntity
    attr_reader :client_id, :client_name, :vote_count

     def initialize(attr = {})
        @client_id = attr[:client_id]
        @client_name = attr[:client_name]
        @vote_count = attr[:vote_count]
     end
  end
end
