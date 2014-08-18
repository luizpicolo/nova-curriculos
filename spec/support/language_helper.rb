module LanguageHelpers
  def name_level(int_level)
    case int_level
    when 1
      "Básico"
    when 2
      "Intermediário"
    when 3
      "Avançado"
    end
  end
end

RSpec.configure do |config|
  config.include LanguageHelpers, :type => :feature
end
