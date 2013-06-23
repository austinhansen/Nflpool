class RemoveColumns < ActiveRecord::Migration
  def up
  	remove_column :games, :winning_team
  end

  def down
  end
end
