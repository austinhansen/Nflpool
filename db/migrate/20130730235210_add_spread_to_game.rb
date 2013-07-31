class AddSpreadToGame < ActiveRecord::Migration
  def change
    add_column :games, :spread, :string
  end
end
