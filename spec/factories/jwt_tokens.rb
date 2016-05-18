FactoryGirl.define do
  factory :jwt_token do
    token "MyText"
    expiration_date "2016-05-18"
  end
end
