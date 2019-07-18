class CreateArtistShows < ActiveRecord::Migration[5.2]
  def change
    create_table :artist_shows do |t|
      t.references :artist
      t.references :show

      t.timestamps
    end
  end
end
