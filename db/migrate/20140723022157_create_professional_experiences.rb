class CreateProfessionalExperiences < ActiveRecord::Migration
  def change
    create_table :professional_experiences do |t|
      t.string :name_company
      t.string :last_post
      t.date :date_entrance
      t.date :date_exit
      t.boolean :jobs_current
      t.text :attributions

      t.timestamps
    end
  end
end
