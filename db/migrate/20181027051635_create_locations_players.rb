class CreateLocationsPlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :locations_players do |t|
      t.integer :location_id
      t.integer :player_id
    end
  end
end
