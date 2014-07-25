class CreateJobPlus < ActiveRecord::Migration
  def change
    create_table :job_plus do |t|
      t.references :job, index:true, null: false
      t.date :start_date
      t.date :finish_date

      t.timestamps
    end
  end
end
