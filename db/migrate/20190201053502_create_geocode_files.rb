class CreateGeocodeFiles < ActiveRecord::Migration[5.2]
  def change
    create_table :geocode_files, id: :uuid do |t|
      t.uuid :geocode_id
      t.timestamps
    end
  end
end
