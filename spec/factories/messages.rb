# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    guildy_id 1
    event_id 1
    message "MyString"
  end
end


