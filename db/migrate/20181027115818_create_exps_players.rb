class CreateExpsPlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :exps_players do |t|
      t.integer :exp_id
      t.integer :player_id
    end
  end
end
