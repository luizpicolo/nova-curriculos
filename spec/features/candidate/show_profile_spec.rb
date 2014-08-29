require 'rails_helper'

feature 'show profile candidate' do
  let!(:user) { FactoryGirl.create(:user) }

  scenario 'with valid curriculum' do
    sign_in user
    visit show_candidate_profile_path(user.slug)
    expect(page).to have_content('Este candidado não atualizou seu currículo')
  end

  scenario 'with invalid curriculum' do
    sign_in user
    candidate = FactoryGirl.create :candidate, :user => user
    visit show_candidate_profile_path(user.slug)
    expect(page).to have_content(candidate.full_name)
  end
end
