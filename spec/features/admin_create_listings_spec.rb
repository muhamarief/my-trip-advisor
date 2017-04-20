require 'rails_helper'

RSpec.feature "Admin Create a Listing", :type => :feature do
  let!(:listing) { FactoryGirl.create(:listing) }
  let!(:admin) { FactoryGirl.create(:admin) }

  # before do
  #   @admin = FactoryGirl.create(:admin)
  #   auth_admins_path @admin
  # end


  scenario "Admins see the listings on the page" do
    # sign_in
    page.set_rack_session(admin_id: admin.id)
    visit new_admin_listing_path(listing)
    fill_in 'listing_item_name', with: "New Item Listing"
    fill_in 'listing_description', with: "The description"

    click_button 'Create Listing'

    expect(page).to have_current_path(admin_listings_path)
  end
end
