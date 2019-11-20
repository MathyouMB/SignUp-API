module Mutations
    class CreateItem < Mutations::BaseMutation
      argument :board_id, ID, required: true
      argument :name, String, required: true
      argument :url, String, required: false
      argument :description, String, required: false

      type Types::ItemType
  
      def resolve(board_id: nil, name: nil, url: nil, description: nil) 

        board = Board.find_by(id: board_id)
        if board.nil?
            raise GraphQL::ExecutionError, "Board with id #{board_id} does not exist"
        end
        
        item = Item.create(
          name: name,
          url: url,
          description: description,
          board_id: board_id,
        )
        raise GraphQL::ExecutionError, board.errors.full_messages.join(", ") unless board.errors.empty?

        item

      end
    end
  end