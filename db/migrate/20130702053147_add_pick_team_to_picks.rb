class AddPickTeamToPicks < ActiveRecord::Migration
  def change
    add_column :picks, :pick_team, :integer
  end
end
