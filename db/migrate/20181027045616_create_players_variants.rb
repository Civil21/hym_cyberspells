class CreatePlayersVariants < ActiveRecord::Migration[5.1]
  def change
    create_table :players_variants do |t|
      t.integer :player_id
      t.integer :variant_id
    end
  end
end
