class AddActiveToPromotions < ActiveRecord::Migration
  def change
    add_column :promotions, :active, :string
  end
end
