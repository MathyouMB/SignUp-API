class Item < ApplicationRecord
    belongs_to :board
    has_one :signup
    has_one :user, through: :signup
end
