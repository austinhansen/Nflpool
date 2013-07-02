class RemovePickTeamIdFromPicks < ActiveRecord::Migration
  def up
    remove_column :picks, :pick_team_id
  end

  def down
    add_column :picks, :pick_team_id, :integer
  end
end
