require 'rails_helper'

feature 'Registration candidate' do
  let!(:user) { FactoryGirl.build(:user) }

  scenario 'with valid data' do
    create_user user, :candidate => true
    expect(page).to have_content('Login efetuado com sucesso.')
  end

  scenario 'with password and password confirmation different' do
    create_user user, candidate: true, password_confirmation: 'wrongpassword'
    expect(page).to have_content('Password confirmation não é igual a Password')
  end

  scenario 'with email invalid' do
    create_user user, candidate: true, email: 'wrongemail'
    expect(page).to have_content('Email não é válido')
  end

  scenario 'with email already registered' do
  	user = FactoryGirl.create(:user)
    create_user user, candidate: true
    expect(page).to have_content('Email já está em uso')
  end
end
