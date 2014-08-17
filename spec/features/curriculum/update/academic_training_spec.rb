require 'rails_helper'

feature 'update academic training' do
  let!(:candidate) { FactoryGirl.create(:candidate) }

  scenario 'with valid data' do
    academic_training = update_academic_training candidate

    expect(page).to have_content(academic_training.name_of_course)
    expect(page).to have_content(academic_training.institution)
    expect(page).to have_content(academic_training.schooling.name)
    expect(page).to have_content(academic_training.start_date.try(:strftime,("%d/%m/%Y")))
    expect(page).to have_content(academic_training.finish_date.try(:strftime,("%d/%m/%Y")))

    expect(page).to have_content('Seus dados foram atualizados com sucesso')
  end
end
