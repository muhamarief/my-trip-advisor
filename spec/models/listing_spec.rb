require 'rails_helper'

RSpec.describe Listing, type: :model do

    it { is_expected.to respond_to(:admin) }
    it { is_expected.to respond_to(:type) }
    it { is_expected.to respond_to(:booking_item) }
    it { is_expected.to respond_to(:subscribe_item) }
    it { is_expected.to respond_to(:purchase_item) }
    it { is_expected.to respond_to(:photos) }

    context "validation" do
      it { is_expected.to validate_presence_of(:admin_id) }
      it { is_expected.to validate_presence_of(:type_id) }
      it { is_expected.to validate_presence_of(:item_name) }

      #good path
      describe "create listing if admin_id, item_name, type_id are presence" do
        When(:listing) { Listing.create(admin_id: 1, type_id: 1, item_name: "New Listing", description: "Test Listing", booking_item_id: 1)}
      end

      #bad path
      describe "failed to create listing without admin_id" do
        When(:user) { Listing.create(type_id: 1, item_name: "New Listing", description: "Test Listing", booking_item_id: 1, purchase_item_id: 3) }
      end

      #bad path
      describe "failed to create listing without type_id" do
        When(:user) { Listing.create(admin_id: 1, item_name: "New Listing", description: "Test Listing", subscribe_item_id: 1, purchase_item_id: 3) }
      end

      #bad path
      describe "failed to create listing without item_name" do
        When(:user) { Listing.create(admin_id: 7, type_id: 1, description: "Test Listing", booking_item_id: 2, purchase_item_id: 3, subscribe_item_id: 7) }
      end
    end

    context "associations" do
      it { is_expected.to have_many(:customer_reviews) }
      it { is_expected.to belong_to(:admin) }
      it { is_expected.to belong_to(:type) }
      it { is_expected.to belong_to(:booking_item) }
      it { is_expected.to belong_to(:subscribe_item) }
      it { is_expected.to belong_to(:purchase_item) }
    end

end
