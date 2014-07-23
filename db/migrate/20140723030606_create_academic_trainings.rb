class CreateAcademicTrainings < ActiveRecord::Migration
  def change
    create_table :academic_trainings do |t|
      t.string :schooling
      t.string :name_of_course
      t.date :start_date
      t.date :finish_date
      t.string :institution

      t.timestamps
    end
  end
end
