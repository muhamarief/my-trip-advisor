FactoryGirl.define do
  factory :admin do
    username "dindaputri"
    email "dinda@yahoo.com"
    password "abcdefg"
    password_confirmation "abcdefg"
    super_admin true
  end
end
