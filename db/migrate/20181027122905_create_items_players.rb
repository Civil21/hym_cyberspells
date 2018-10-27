class CreateItemsPlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :items_players do |t|
      t.integer :item_id
      t.integer :player_id
    end
  end
end
