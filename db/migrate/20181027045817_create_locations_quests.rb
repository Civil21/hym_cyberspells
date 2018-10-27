class CreateLocationsQuests < ActiveRecord::Migration[5.1]
  def change
    create_table :locations_quests, id: false do |t|
      t.integer :location, index: true
      t.integer :quest, index: true
    end
  end
end
