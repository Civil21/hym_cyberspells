class CreateVariantNexts < ActiveRecord::Migration[5.1]
  def change
    create_table :variant_nexts do |t|
      t.integer :variant_id
      t.integer :next

      t.timestamps
    end
  end
end
