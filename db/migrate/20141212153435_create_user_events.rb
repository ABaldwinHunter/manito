class CreateUserEvents < ActiveRecord::Migration
  def change
    create_table :user_events do |t|
      t.integer :user_id#giver_id
      t.integer :giftee_id
      t.references :event
    end
  end
end
