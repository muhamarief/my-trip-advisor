require 'rails_helper'

RSpec.feature "Admin Create a Listing", :type => :feature do
  let!(:listing) { FactoryGirl.create(:listing) }
  let!(:admin) { FactoryGirl.create(:admin) }
  let!(:outlet) { FactoryGirl.create(:outlet) }

  # before do
  #   @admin = FactoryGirl.create(:admin)
  #   auth_admins_path @admin
  # end


  scenario "Admins see the listings on the page" do
    page.set_rack_session(admin_id: admin.id)
    visit new_admin_outlet_listing_path(outlet, listing)
    fill_in 'listing_item_name', with: "New Item Listing"
    fill_in 'listing_description', with: "The description"
    
    click_button 'Create Listing'

    expect(page).to have_current_path(admin_outlet_listings_path(outlet))
  end
end
