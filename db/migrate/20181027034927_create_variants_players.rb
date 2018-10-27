class CreateVariantsPlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :variants_players do |t|
      t.integer :variant_id
      t.integer :player_id
    end
  end
end
