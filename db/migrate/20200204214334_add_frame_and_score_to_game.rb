class AddFrameAndScoreToGame < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :frame, :integer
    add_column :games, :score, :integer
    add_column :games, :score_hash, :json, default: {}

  end
end
