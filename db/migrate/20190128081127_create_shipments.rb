class CreateShipments < ActiveRecord::Migration[5.2]
  def change
    create_table :shipments, id: :uuid do |t|
      t.string :remote_id
      t.uuid :organisation_id
      t.uuid :job_id
      t.uuid :vehicle_id
      t.uuid :pickup_id
      t.uuid :delivery_id
      t.integer :weight
      t.string :rawaddress
      t.string :service_level
      t.integer :number_of_packages, default: 1
      t.decimal :handlingtime
      t.string :delivery_type
      t.timestamps
    end
  end
end
