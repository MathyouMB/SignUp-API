class BoardHasItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :board, foreign_key: true
  end
end
