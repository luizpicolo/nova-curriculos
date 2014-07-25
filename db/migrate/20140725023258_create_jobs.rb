class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :job_title
      t.references :company, index:true, null: false
      t.string :salary_range
      t.references :type_contract, index:true, null: false
      t.references :job_category, index:true, null: false
      t.integer :amount_vacancies
      t.string :time_contract
      t.text :description
      t.text :requirements
      t.string :period_of_work
      t.text :other_information

      t.timestamps
    end
  end
end
