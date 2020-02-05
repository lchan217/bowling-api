class AddTurnSpareBallsAndStrikeBallsToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :turn, :integer
    add_column :games, :turn_2, :boolean, default: true
    add_column :games, :spareBalls, :integer
    add_column :games, :strikeBalls, :integer
  end
end
