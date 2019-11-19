module Types
  class UserType < BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :firstName, String, null: false
    field :lastName, String, null: false
    field :email, String, null: true
    field :token, String, null: false
    field :boards,[BoardType], null: true
    field :signups, [SignupType], null: true
    field :items, [ItemType], null: true
  end
end
