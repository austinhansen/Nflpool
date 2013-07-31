class RemoveSpreadFromGame < ActiveRecord::Migration
  def change
    remove_column :games, :spread, :integer
  end
end
