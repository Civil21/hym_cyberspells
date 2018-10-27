class CreateLocationsQuests < ActiveRecord::Migration[5.1]
  def change
    create_table :locations_quests do |t|
      t.integer :location_id
      t.integer :quest_id
    end
  end
end
