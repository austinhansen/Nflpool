class CreatePicks < ActiveRecord::Migration
  def change
    create_table :picks do |t|
      t.integer :pick_team_id
      t.date :date
      t.integer :user_id

      t.timestamps
    end
  end
end
