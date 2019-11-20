module Mutations
    class CreateSignup < Mutations::BaseMutation
      argument :user_id, ID, required: true
      argument :item_id, ID, required: true

      type Types::SignupType
  
      def resolve(user_id: nil, item_id: nil) 

        user = User.find_by(id: user_id)
        if user.nil?
            raise GraphQL::ExecutionError, "User with id #{user_id} does not exist"
        end

        item = Item.find_by(id: item_id)
        if item.nil?
            raise GraphQL::ExecutionError, "Item with id #{item_id} does not exist"
        end

        signup = Signup.create(
          user_id: user_id,
          item_id: item_id,
        )
        raise GraphQL::ExecutionError, signup.errors.full_messages.join(", ") unless signup.errors.empty?

        signup

      end
    end
  end