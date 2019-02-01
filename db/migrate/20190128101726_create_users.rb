class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users, id: :uuid do |t|
      t.string :name
      t.uuid :organisation_id
      t.boolean :is_geoengine_user, default: false
      t.date :quota_reset_date
      t.date :quota_last_accessed_date
      t.integer :quota_usage_count
      t.string :email
      t.string :password_digest
      t.timestamps
    end
  end
end
