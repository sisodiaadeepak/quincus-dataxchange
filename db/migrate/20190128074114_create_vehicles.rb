class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles, id: :uuid do |t|
      t.string :remote_id
      t.uuid :organisation_id
      t.uuid :job_id
      t.decimal :latitude
      t.decimal :longitude
      t.integer :capacity
      t.string :vehicle_type
      t.boolean :is_active, default: true
      t.datetime :last_delivery_time
      t.timestamps
    end
  end
end
