require 'rails_helper'

feature 'Professional goal' do
  let!(:candidate) { FactoryGirl.create(:candidate) }

  scenario 'with valid data' do
    update_goal candidate
    expect(page).to have_content('Seus dados foram atualizados com sucesso')
  end
end
