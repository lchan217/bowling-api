class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.integer :pins
      t.text :score

      t.timestamps
    end
  end
end
