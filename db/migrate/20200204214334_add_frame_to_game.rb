class AddFrameToGame < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :frame, :integer
  end
end
