class CreateQuests < ActiveRecord::Migration[5.1]
  def change
    create_table :quests do |t|
      t.string :name
      t.string :description
      t.integer :location_id
      t.integer :location_id
      t.timestamps
    end
  end
end
