class AddSpreadToGames < ActiveRecord::Migration
  def change
    add_column :games, :spread, :integer
  end
end
