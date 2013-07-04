class AddGameIdToPicks < ActiveRecord::Migration
  def change
    add_column :picks, :game_id, :integer
  end
end
