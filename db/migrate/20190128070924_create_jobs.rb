class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs, id: :uuid do |t|
      t.uuid :organisation_id
      t.string :algo_id
      t.integer :status, default: 0
      t.time :delivery_start_time
      t.string :delivery_timezone_char, default: 'UTC+00:00'
      t.date :delivery_date
      t.timestamps
    end
  end
end
