class CreateJobPremiuns < ActiveRecord::Migration
  def change
    create_table :job_premiuns do |t|
      t.date :start_date
      t.date :finish_date
      t.references :job, index:true, null: false

      t.timestamps
    end
  end
end
