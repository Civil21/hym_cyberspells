class CreateGameLogsLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :game_logs_locations do |t|
      t.integer :game_log_id
      t.integer :location_id
    end
  end
end
