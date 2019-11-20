module Mutations
    class Mutations::DeleteItem < Mutations::BaseMutation
        argument :id, ID, required: true
      
        type Types::ItemType
      
        def resolve(id:)
            
            item = Item.find_by(id: id)
           
            if item.present?
                if item.signup.present?
                    
                    #if the item has been signed up for... we need to delete it from its User's signup to avoid foreign key violations
                    
                    user = User.find(item.signup.user_id)
                    selected_signup = user.signups.find(item.signup.id)
                    selected_signup.destroy
                    raise GraphQL::ExecutionError, selected_signup.errors.full_messages.join(", ") unless selected_signup.errors.empty?
                   
                    item.signup.destroy
                    raise GraphQL::ExecutionError, item.signup.errors.full_messages.join(", ") unless item.signup.errors.empty?
                    
                    item.destroy
                    raise GraphQL::ExecutionError, item.errors.full_messages.join(", ") unless item.errors.empty?
                    item

                else
                    item.destroy
                    raise GraphQL::ExecutionError, item.errors.full_messages.join(", ") unless item.errors.empty?
                    item
                end
            else
                raise GraphQL::ExecutionError, "Item with id #{id} does not exist"
            end

        end
      end
    end