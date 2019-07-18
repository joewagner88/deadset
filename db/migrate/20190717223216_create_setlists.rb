class CreateSetlists < ActiveRecord::Migration[5.2]
  def change
    create_table :setlists do |t|
      t.integer :number
      t.integer :encore
      t.references :show

      t.timestamps
    end
  end
end
