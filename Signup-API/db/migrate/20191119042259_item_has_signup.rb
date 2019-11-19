class ItemHasSignup < ActiveRecord::Migration[5.2]
  def change
    add_reference :signups, :item, foreign_key: true
  end
end
