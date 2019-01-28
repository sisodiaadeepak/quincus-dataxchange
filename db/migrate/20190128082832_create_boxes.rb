class CreateBoxes < ActiveRecord::Migration[5.2]
  def change
    create_table :boxes, id: :uuid do |t|
      t.uuid :organisation_id
      t.uuid :shipment_id
      t.integer :mass
      t.integer :height
      t.integer :width
      t.integer :depth
      t.string :package_type
      t.timestamps
    end
  end
end
