class CreateProfessionalExperiences < ActiveRecord::Migration
  def change
    create_table :professional_experiences do |t|
      t.string :name_company, null: false
      t.string :last_post, null: false
      t.date :start_date, null: false
      t.date :finish_date
      t.boolean :jobs_current, null: false, default: false
      t.text :attributions

      t.timestamps
    end
  end
end
