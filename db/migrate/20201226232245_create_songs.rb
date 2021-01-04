class CreateSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :songs do |t|
      t.string :name
      t.string :album
      t.string :release_date
      t.integer :artist_id
      t.integer :genre_id
      t.timestamps
    end
  end
end
