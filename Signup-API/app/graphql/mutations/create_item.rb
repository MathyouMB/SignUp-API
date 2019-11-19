module Mutations
    class CreateItem < Mutations::BaseMutation
      argument :board_id, ID, required: true
      argument :name, String, required: true
      argument :url, String, required: false
      argument :description, String, required: false

      type Types::ItemType
  
      def resolve(board_id: nil, name: nil, url: nil, description: nil) 

        Item.create(
          name: name,
          url: url,
          description: description,
          board_id: board_id,
        )

      end
    end
  end