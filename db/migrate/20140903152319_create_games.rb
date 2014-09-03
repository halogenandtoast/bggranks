class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title, null: false
      t.string :bgg_id, null: false
      t.string :year, null: false

      t.timestamps
    end

    add_index :games, :bgg_id, unique: true
  end
end
