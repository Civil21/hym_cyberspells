class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.integer :user_id
      t.integer :location_id
      t.integer :quest_id
      t.string :name

      t.timestamps
    end
  end
end
