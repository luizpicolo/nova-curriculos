require 'rails_helper'

feature 'update language' do
  let!(:candidate) { FactoryGirl.create(:candidate) }

  scenario 'with valid data' do
    language = update_language candidate

    expect(page).to have_content(language.speech)
    expect(page).to have_content(name_level language.level.to_i)

    expect(page).to have_content('Seus dados foram atualizados com sucesso')
  end
end
