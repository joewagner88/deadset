class AddMbidToVenues < ActiveRecord::Migration[5.2]
  def change
    add_column :venues, :mbid, :integer
  end
end
