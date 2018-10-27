class CreateGameLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :game_logs do |t|
      t.string :text
      t.integer :player_id

      t.timestamps
    end
  end
end
