class AddPickTeamIdToPicks < ActiveRecord::Migration
  def change
    add_column :picks, :pick_team_id, :integer
  end
end
