class CreateArtists < ActiveRecord::Migration[6.1]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :instrument
      t.integer :years_active
      t.timestamps
    end
  end
end
