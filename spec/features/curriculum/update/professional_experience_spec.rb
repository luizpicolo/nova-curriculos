require 'rails_helper'

feature 'update professional experience' do
  let!(:candidate) { FactoryGirl.create(:candidate) }

  scenario 'with valid data' do
    professional_experience = update_professional_experience candidate

    expect(page).to have_content(professional_experience.speech)
    expect(page).to have_content(name_level professional_experience.level)

    expect(page).to have_content('Seus dados foram atualizados com sucesso')
  end
end
