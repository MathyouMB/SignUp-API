module Mutations
    class Mutations::DeleteItem < Mutations::BaseMutation
        argument :id, ID, required: true
      
        type Types::ItemType
      
        def resolve(id:)
            
            item = Item.find_by(id: id)
           
            if item.present?
                if item.signup.present?
                    
                    #if the item has been signed up for... we need to delete it from its User's signup to avoid foreign key violations
                    u = User.find(item.signup.user_id)
                    u.signups.find(item.signup.id).destroy
                    item.signup.destroy
                    item.destroy
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