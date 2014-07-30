FactoryGirl.define do
  factory :language do
    speech "English"
    level 1
    candidate factory: :candidate
  end
end
