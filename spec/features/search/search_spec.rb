require 'rails_helper'

feature 'Search', :search => true, :solr => true do
  let!(:job) { FactoryGirl.create(:job) }

  scenario 'when searching job by title' do	
  	Sunspot.commit
    execute_search job.job_title
    expect(page).to have_content(job.job_title)
  end

  scenario 'when searching job by company corporate name' do	
  	Sunspot.commit
    execute_search job.company.corporate_name
    expect(page).to have_content(job.job_title)
  end

  scenario 'when searching job by company fancy name' do	
  	Sunspot.commit
    execute_search job.company.fancy_name
    expect(page).to have_content(job.job_title)
  end

  scenario 'when searching job by city' do	
  	Sunspot.commit
    execute_search job.city.name
    expect(page).to have_content(job.job_title)
  end

  scenario 'when searching job by state' do	
  	Sunspot.commit
    execute_search job.city.state.name
    expect(page).to have_content(job.job_title)
  end

  scenario 'when searching job by category' do	
  	Sunspot.commit
    execute_search nil, job.job_category.name
    expect(page).to have_content(job.job_title)
  end

  scenario 'when searching job by title and category' do	
  	Sunspot.commit
    execute_search job.job_title, job.job_category.name
    expect(page).to have_content(job.job_title)
  end

  scenario 'when searching job by city and category' do	
  	Sunspot.commit
    execute_search job.city.name, job.job_category.name
    expect(page).to have_content(job.job_title)
  end

  scenario 'when searching job by state and category' do	
  	Sunspot.commit
    execute_search job.city.state.name, job.job_category.name
    expect(page).to have_content(job.job_title)
  end

  scenario 'when searching job by company corporate name and category' do	
  	Sunspot.commit
    execute_search job.company.corporate_name, job.job_category.name
    expect(page).to have_content(job.job_title)
  end

end
