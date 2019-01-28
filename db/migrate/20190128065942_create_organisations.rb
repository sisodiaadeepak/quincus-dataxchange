class CreateOrganisations < ActiveRecord::Migration[5.2]
  def change
    create_table :organisations, id: :uuid do |t|
       t.string :name
       t.time :default_delivery_start_time
      t.timestamps
    end
  end
end
