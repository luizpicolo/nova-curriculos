require 'rails_helper'

feature 'Update candidate' do
  let!(:candidate) { FactoryGirl.create(:candidate) }

  scenario 'with valid data' do
    updating_data candidate
    expect(page).to have_content('Seus dados foram atualizados com sucesso')
  end
end
