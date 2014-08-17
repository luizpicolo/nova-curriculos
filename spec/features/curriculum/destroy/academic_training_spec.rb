require 'rails_helper'

feature 'destroy academic training' do
  let!(:candidate) { FactoryGirl.create(:candidate) }

  scenario 'with sucess?' do
    academic_training = destroy_academic_training candidate
    expect(page).to have_content('Formação acadêmica deletada com sucesso')
  end
end
