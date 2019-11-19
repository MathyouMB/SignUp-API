module Types
    class ItemType < BaseObject
      field :id, ID, null: false
      field :name, String, null: false
      field :url, String, null: false
      field :description, String, null: false
      field :posted_on, BoardType, null: true, method: :board
    end
end