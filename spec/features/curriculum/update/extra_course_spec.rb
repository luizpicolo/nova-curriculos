require 'rails_helper'

feature 'update extra course' do
  let!(:candidate) { FactoryGirl.create(:candidate) }

  scenario 'with valid data' do
    extra_course = update_extra_course candidate

    expect(page).to have_content(extra_course.name)
    expect(page).to have_content(extra_course.local)
    expect(page).to have_content(extra_course.description)

    expect(page).to have_content('Seus dados foram atualizados com sucesso')
  end
end
