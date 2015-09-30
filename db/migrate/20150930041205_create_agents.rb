class CreateAgents < ActiveRecord::Migration
  def change
    create_table :agents do |t|
      t.string :name
      t.string :url
      t.string :title_select
      t.string :info_select
      t.timestamps
    end
  end
end
