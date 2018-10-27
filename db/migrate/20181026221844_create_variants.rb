class CreateVariants < ActiveRecord::Migration[5.1]
  def change
    create_table :variants do |t|
      t.string :text
      t.string :description
      t.integer :item_id
      t.integer :exp_id
      t.boolean :isFinish
      t.boolean :isDeath

      t.timestamps
    end
  end
end
