class RemovePickTeamFromPicks < ActiveRecord::Migration
  def up
    remove_column :picks, :pick_team
  end

  def down
    add_column :picks, :pick_team, :integer
  end
end
