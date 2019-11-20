module Mutations
    class CreateUser < Mutations::BaseMutation
      argument :email, String, required: true
      argument :password, String, required: true
      argument :passwordConfirmation, String, required: true
      argument :firstName, String, required: true
      argument :lastName, String, required: true

      type Types::UserType
        #add password validation error handling
      def resolve(email:, password:, password_confirmation:, first_name:, last_name:)
        User.create(
            email: email, 
            password: password, 
            password_confirmation: password_confirmation, 
            first_name: first_name, 
            last_name: last_name
          )
      end
    end
  end