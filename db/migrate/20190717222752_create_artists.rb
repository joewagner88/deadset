class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :sort_name
      t.string :mbid

      t.timestamps
    end
  end
end
