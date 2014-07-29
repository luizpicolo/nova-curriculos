FactoryGirl.define do
  factory :language do
    speech "English"
    level 1
    user factory: :user
  end
end
