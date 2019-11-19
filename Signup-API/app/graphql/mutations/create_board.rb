module Mutations
    class CreateBoard < Mutations::BaseMutation
      argument :user_id, ID, required: true
      argument :name, String, required: true
      argument :description, String, required: false
     
      #field :board, Types::BoardType, null: true
      type Types::BoardType
  
      def resolve(user_id: nil, name: nil, description: nil) 
        #b = Board.new(name: name, description: description, user_id);
        #b.save
        #p(b.errors.full_messages)
       
        Board.create(
          name: name,
          description: description,
          user_id: user_id,
        )

        #raise GraphQL::ExecutionError.new('nice')
      end
    end
  end