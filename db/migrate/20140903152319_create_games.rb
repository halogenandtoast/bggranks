class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.string :bgg_id
      t.string :year

      t.timestamps
    end
  end
end
