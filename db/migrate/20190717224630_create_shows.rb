class CreateShows < ActiveRecord::Migration[5.2]
  def change
    create_table :shows do |t|
      t.string :name
      t.datetime :event_date
      t.references :venue

      t.timestamps
    end
  end
end
