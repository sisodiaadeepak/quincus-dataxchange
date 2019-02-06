class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
  	remove_column :flat_shipments, :driverId
  	add_column :flat_shipments, :driver_id, :uuid
  end

end
