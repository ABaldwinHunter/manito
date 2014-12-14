class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :exchange_date
      t.string :draw_date
      t.integer :max_price
      t.string :title
      t.text :description
      t.string :location
      t.integer :admin_id
      t.string :invite_key
      t.text :emails
      t.text :message

      t.timestamps
    end
  end
end
