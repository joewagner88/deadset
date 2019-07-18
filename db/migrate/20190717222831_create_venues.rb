class CreateVenues < ActiveRecord::Migration[5.2]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :city
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
