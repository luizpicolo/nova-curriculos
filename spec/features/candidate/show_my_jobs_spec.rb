require 'rails_helper'

feature 'show my jobs' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:candidate) { FactoryGirl.create(:candidate) }

  scenario 'with not updated curriculum' do
    sign_in user
    visit show_vacancies_path
    expect(page).to have_content('Por favor, atualize seu currículo e pague com um post no facebook =) ')
  end

  # scenario 'with updated curriculum' do
  #   sign_in user
  #   updating_information candidate
  #   visit show_vacancies_path
  #   expect(page).to have_content('Minhas Vagas')
  # end
end
