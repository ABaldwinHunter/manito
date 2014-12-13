class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.date :exchange_date
      t.date :draw_date
      t.integer :max_price
      t.string :title
      t.text :description
      t.string :location
      t.references :user #admin
      t.string :invite_key
      t.text :emails
      t.text :message

      t.timestamps
    end
  end
end
