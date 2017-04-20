module FeatureHelpers
  def sign_in
    @admin = FactoryGirl.create(:admin)
    visit "/admin/listings/new"
    fill_in "dinda@yahoo.com", with: @admin.email
    fill_in "abcdefg", with: @admin.password
    click_button "Log in"
  end
end
