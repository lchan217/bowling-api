class AddFrameAndScoreToGame < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :frame, :integer
    add_column :games, :score, :json, default: {}
  end
end
