class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.date :exchange_date
      t.date :draw_date
      t.integer :max_price
      t.string :location
      t.references :user #admin
      t.string :invite_key

      t.timestamps
    end
  end
end