class AddColumnToFlatshipments < ActiveRecord::Migration[5.2]
  def change
  	add_column :flat_shipments, :depot_longitude, :decimal
  	add_column :flat_shipments, :depot_latitude, :decimal
  	add_column :flat_shipments, :batch_id, :string
  	rename_column :flat_shipments, :recipient_line, :recipientline
    rename_column :flat_shipments, :shipper_line, :shipperline
  end

end
