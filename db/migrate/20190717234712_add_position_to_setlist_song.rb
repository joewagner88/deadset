class AddPositionToSetlistSong < ActiveRecord::Migration[5.2]
  def change
    add_column :setlist_songs, :position, :integer
  end
end
