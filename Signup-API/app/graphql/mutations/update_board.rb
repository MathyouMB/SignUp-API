module Mutations
    class Mutations::UpdateBoard < Mutations::BaseMutation
        argument :id, ID, required: true
        argument :name, String, required: false
        argument :description, String, required: false
      
        type Types::BoardType
      
        def resolve(id:, name: nil, description: nil)
            
            board = Board.find_by(id: id)

            if board.present?
                
                board.name = name if name.present?
                board.description = description if description.present?
                board.save

                raise GraphQL::ExecutionError, board.errors.full_messages.join(", ") unless board.errors.empty?
                board
            else
                raise GraphQL::ExecutionError, "Board with id #{id} does not exist"
            end

        end
      end
    end