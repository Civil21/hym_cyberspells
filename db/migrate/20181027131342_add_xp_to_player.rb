class AddXpToPlayer < ActiveRecord::Migration[5.1]
  def change
    add_column :players, :xp, :integer, default: 0
  end
end
