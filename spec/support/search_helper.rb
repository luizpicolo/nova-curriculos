module SearchHelpers
  def execute_search(text, category = nil)
  	visit root_path

  	fill_in "search", with: text
    select(category, :from => 'category')
  	click_button 'Busca'
  end
end

RSpec.configure do |config|
  config.include SearchHelpers, :type => :feature
end
