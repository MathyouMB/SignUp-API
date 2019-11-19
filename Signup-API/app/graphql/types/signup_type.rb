module Types
    class SignupType < BaseObject
      field :id, ID, null: false
      field :user_id, ID, null: false
      field :item_id, ID, null: false
      field :user, UserType, null: true, method: :user
      field :item, ItemType, null: true, method: :item
    end
end