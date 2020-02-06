class AddTurnSpareBallsAndStrikeBallsToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :turn, :integer
    add_column :games, :spareBalls, :integer
    add_column :games, :strikeBalls, :integer
  end
end
