module Types
  class MutationType < Types::BaseObject

    #Model Operations
    field :create_board,
          mutation: Mutations::CreateBoard,
          description: 'Create Board'

    field :update_board,
          mutation: Mutations::UpdateBoard,
          description: 'Update Board'

    field :create_item,
          mutation: Mutations::CreateItem,
          description: 'Create Item'
    
    field :delete_item,
          mutation: Mutations::DeleteItem,
          description: 'Delete Item'

    field :create_signup,
          mutation: Mutations::CreateSignup,
          description: 'Create Signup'

    #User Operations
    field :login,
          mutation: Mutations::UserLogin,
          description: 'Login with your credentials'

    field :update_user,
          mutation: Mutations::UpdateUser,
          description: 'Update user'
    
    field :sign_up,
          mutation: Mutations::CreateUser,
          description: "Sign up for users"
        
    field :token_login, UserType, null: true do
      description "JWT token login"
    end
    def token_login
      context[:current_user]
    end

    field :logout, Boolean, null: true do
      description "Logout for users"
    end
    def logout
      if context[:current_user]
        context[:current_user].update(jti: SecureRandom.uuid)
        return true
      end 
      false
    end

    field :send_reset_password_instructions, Boolean, null: true do
      description "Send password reset instructions to users email"
      argument :email, String, required: true
    end
    def send_reset_password_instructions(email:)
      user = User.find_by_email(email)
      return true if !user
      user.send_reset_password_instructions
      true
    end

    field :reset_password, Boolean, null: true do
      argument :password, String, required: true
      argument :passwordConfirmation, String, required: true
      argument :resetPasswordToken, String, required: true
    end
    def reset_password(password:, password_confirmation:, reset_password_token:)
      user = User.with_reset_password_token(reset_password_token)
      return false if !user
      user.reset_password(password, password_confirmation)
    end  

    #
    # uncomment for unlock instructions
    #
    # UNLOCK ACCOUNT
    # field :unlock, Boolean, null: false do
    #   argument :unlockToken, String, required: true
    # end
    # def unlock(unlock_token:)
    #   user = User.unlock_access_by_token(unlock_token)
    #   return user.id
    # end

    # RESEND UNLOCK INSTRUCTIONS
    # field :resend_unlock_instructions, Boolean, null: false do
    #   argument :email, String, required: true
    # end
    # def resend_unlock_instructions(email:)
    #   user = User.find_by_email(email)
    #   return false if !user

    #   user.resend_unlock_instructions
    # end
  end
end
  