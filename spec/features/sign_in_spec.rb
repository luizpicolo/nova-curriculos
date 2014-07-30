require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

feature 'Sign in', :js => true do
  let!(:user) { FactoryGirl.create(:user) }

  scenario 'with valid credentials' do
    login_as(user, :scope => :user)
    expect(page).to have_content('Login efetuado com sucesso!')
  end

  scenario 'with invalid credentials' do
    sign_in user, password: 'wrongpassword'
    expect(page).to have_content('E-mail ou senha inválidos.')
  end
end
