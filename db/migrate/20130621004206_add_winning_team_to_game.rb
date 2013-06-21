class AddWinningTeamToGame < ActiveRecord::Migration
  def change
    add_column :games, :winning_team, :integer
  end
end
