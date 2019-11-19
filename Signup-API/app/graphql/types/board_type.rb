module Types
    class BoardType < BaseObject
      field :id, ID, null: false
      field :name, String, null: false
      field :description, String, null: false
      field :items,[ItemType], null:false
    end
end