class CreateSetlistSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :setlist_songs do |t|
      t.references :setlist
      t.references :song

      t.timestamps
    end
  end
end
