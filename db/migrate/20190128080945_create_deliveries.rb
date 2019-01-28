class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries, id: :uuid do |t|
      t.uuid :organisation_id
      t.uuid :address_id
      t.decimal :latitude
      t.decimal :longitude
      t.integer :priority
      t.integer :timewindowstart
      t.integer :timewindowend
      t.datetime :date
      t.timestamps
    end
  end
end
