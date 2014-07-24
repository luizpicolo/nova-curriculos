class CreateAcademicTrainings < ActiveRecord::Migration
  def change
    create_table :academic_trainings do |t|
      t.string :schooling, null: false
      t.string :name_of_course, null: false
      t.date :start_date, null: false
      t.date :finish_date
      t.string :institution, null: false

      t.timestamps
    end
  end
end
