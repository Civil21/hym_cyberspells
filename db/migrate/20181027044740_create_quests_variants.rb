class CreateQuestsVariants < ActiveRecord::Migration[5.1]
  def change
    create_table :quests_variants do |t|
      t.integer :quest_id
      t.integer :variant_id
    end
  end
end
