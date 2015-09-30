class CreatePromotions < ActiveRecord::Migration
  def change
    create_table :promotions do |t|
      t.string :agent_id
      t.string :title
      t.string :info
      t.timestamps
    end
  end
end
