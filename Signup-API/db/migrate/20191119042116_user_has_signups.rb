class UserHasSignups < ActiveRecord::Migration[5.2]
  def change
    add_reference :signups, :user, foreign_key: true
  end
end
