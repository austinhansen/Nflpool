class AddWagerToPick < ActiveRecord::Migration
  def change
    add_column :picks, :wager, :integer
  end
end
