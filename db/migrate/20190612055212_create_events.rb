class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name, limit: 100, null: false
      t.string :place, null: false
      t.text :image
      t.date :date, null: false
      t.time :start_at, null: false
      t.time :end_at
      t.text :link_url
      t.integer :cost, null: false
      t.integer :capacity, null: false
      t.text :meta

      t.timestamps
    end
  end
end
