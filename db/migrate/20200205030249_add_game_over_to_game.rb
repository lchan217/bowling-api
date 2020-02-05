class AddGameOverToGame < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :game_over, :boolean, default: false
  end
end
