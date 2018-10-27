class CreatePlayersQuests < ActiveRecord::Migration[5.1]
  def change
    create_table :players_quests do |t|
    	t.integer :player_id
      	t.integer :quest_id
    end
  end
end
