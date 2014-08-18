require 'rails_helper'

feature 'update professional experience' do
  let!(:candidate) { FactoryGirl.create(:candidate) }

  scenario 'with valid data' do
    professional_experience = update_professional_experience candidate

    expect(page).to have_content(professional_experience.last_post)
    expect(page).to have_content(professional_experience.name_company)
    expect(page).to have_content(professional_experience.attributions)

    expect(page).to have_content('Seus dados foram atualizados com sucesso')
  end
end
