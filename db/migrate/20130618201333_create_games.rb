class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.date :date
      t.integer :team_one_id
      t.integer :team_two_id

      t.timestamps
    end
  end
end
