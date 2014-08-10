class AddFullnameAndHomecommercialAndPhoneMessageAndMinicurriculumToCandidate < ActiveRecord::Migration
  def change
    add_column :candidates, :full_name, :string
    add_column :candidates, :home_commercial, :string
    add_column :candidates, :phone_message, :string
    add_column :candidates, :mini_curriculum, :text
  end
end
