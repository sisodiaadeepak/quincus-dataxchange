class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses, id: :uuid do |t|
      t.uuid :organisation_id
      t.string :raw_string
      t.string :building_name
      t.string :building_number
      t.string :city_name
      t.string :zipcode
      t.string :country_code
      t.timestamps
    end
  end
end
