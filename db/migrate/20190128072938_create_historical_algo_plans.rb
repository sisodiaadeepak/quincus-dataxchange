class CreateHistoricalAlgoPlans < ActiveRecord::Migration[5.2]
  def change
    create_table :historical_algo_plans, id: :uuid do |t|
      t.uuid :organisation_id
      t.string :algo_id
      t.uuid :job_id
      t.timestamps
    end
  end
end
