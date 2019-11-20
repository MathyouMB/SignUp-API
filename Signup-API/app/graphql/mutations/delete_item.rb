module Mutations
    class Mutations::DeleteItem < Mutations::BaseMutation
        argument :id, ID, required: true
      
        type Types::ItemType
      
        def resolve(id:)
            
            item = Item.find_by(id: id)
           
            if item.present?
                if item.signup.present?
                    raise GraphQL::ExecutionError, "Someone has signed up to bring this item, so we cannot delete it."
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