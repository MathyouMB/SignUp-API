module Types
    class BoardType < BaseObject
      field :id, ID, null: false
      field :name, String, null: false
      field :description, String, null: true
      field :items,[ItemType], null:false
      field :posted_by, UserType, null: true, method: :user
    end
end