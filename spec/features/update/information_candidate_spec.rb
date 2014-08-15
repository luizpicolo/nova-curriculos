require 'rails_helper'

feature 'Update information candidate' do
  let!(:candidate) { FactoryGirl.create(:candidate) }

  scenario 'with valid data' do
    updating_information candidate
    expect(page).to have_content('Seus dados foram atualizados com sucesso')
  end

  scenario 'with full name empty' do
    updating_information candidate, true, :full_name => ""
    expect(page).to have_content('Full name não pode ficar em branco')
  end

  scenario 'with full birth date empty' do
    updating_information candidate, true, :birth_date => ""
    expect(page).to have_content('Birth date não pode ficar em branco')
  end

  scenario 'with full mobile phone empty' do
    updating_information candidate, true, :mobile_phone => ""
    expect(page).to have_content('Mobile phone não pode ficar em branco')
  end

  scenario 'with full message phone empty' do
    updating_information candidate, true, :message_phone => ""
    expect(page).to have_content('Message phone não pode ficar em branco')
  end
end
