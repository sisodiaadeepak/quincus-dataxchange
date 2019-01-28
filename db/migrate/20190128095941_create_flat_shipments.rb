class CreateFlatShipments < ActiveRecord::Migration[5.2]
  def change
    create_table :flat_shipments, id: :uuid do |t|
      t.uuid :organisation_id
      t.uuid :job_id
      t.uuid :vehicle_id
      t.string :driverId
      t.decimal :driverlat
      t.decimal :driverlon
      t.datetime :time_now
      t.decimal :lat
      t.decimal :lon
      t.date :order_date
      t.time :order_time
      t.string :service_type
      t.string :service_level
      t.integer :volume
      t.integer :weight
      t.decimal :eta
      t.decimal :old_eta
      t.string :status
      t.string :dispatch_code
      t.string :shipper_line
      t.string :pickup_address
      t.decimal :pickup_latitude
      t.decimal :pickup_longitude
      t.time :pickup_start_time
      t.time :pickup_commit_time
      t.string :pickup_start_time_timezone
      t.string :recipient_line
      t.string :delivery_address
      t.decimal :delivery_latitude
      t.decimal :delivery_longitude
      t.string :delivery_date
      t.time :delivery_start_time
      t.time :delivery_commit_time
      t.string :delivery_start_time_timezone
      t.integer :total_stops, default: 0
      t.integer :delivery_sequence_index, default: 0
      t.integer :stop_sequence, default: 0
      t.integer :section_number, default: 0
      t.integer :priority
      t.integer :timewindowstart
      t.integer :timewindowend
      t.integer :number_of_packages, default: 0
      t.string :handling_id
      t.decimal :handlingtime
      t.float :actual_delivery_time
      t.string :algo_arrival_time
      t.string :algo_end_time
      t.string :delivery_type
      t.timestamps
    end
  end
end
