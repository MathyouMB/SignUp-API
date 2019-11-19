module Mutations
    class CreateSignup < Mutations::BaseMutation
      argument :user_id, ID, required: true
      argument :item_id, ID, required: true

      type Types::SignupType
  
      def resolve(user_id: nil, item_id: nil) 

        Signup.create(
          user_id: user_id,
          item_id: item_id,
        )

      end
    end
  end