class CreateGeocodes < ActiveRecord::Migration[5.2]
  def change
    create_table :geocodes, id: :uuid do |t|
       t.uuid :organisation_id
       t.string :geobatch_id
       t.integer :status
      t.timestamps
    end
  end
end
