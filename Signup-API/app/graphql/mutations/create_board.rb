module Mutations
    class CreateBoard < Mutations::BaseMutation
      argument :user_id, ID, required: true
      argument :name, String, required: true
      argument :description, String, required: false
     
      #field :board, Types::BoardType, null: true
      type Types::BoardType
  
      def resolve(user_id: nil, name: nil, description: nil) 

        user = User.find_by(id: user_id)
        if user.nil?
            raise GraphQL::ExecutionError, "User with id #{user_id} does not exist"
        end

        board = Board.create(
          name: name,
          description: description,
          user_id: user_id,
        )
        raise GraphQL::ExecutionError, board.errors.full_messages.join(", ") unless board.errors.empty?
        
        board

      end
    end
  end