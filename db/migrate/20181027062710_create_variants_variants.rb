class CreateVariantsVariants < ActiveRecord::Migration[5.1]
  def change
    create_table :variants_variants do |t|
      t.integer :variants
      t.integer :variants
    end
  end
end
