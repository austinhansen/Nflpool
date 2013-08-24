class AddBonusToGame < ActiveRecord::Migration
  def change
    add_column :games, :bonus, :boolean
  end
end
