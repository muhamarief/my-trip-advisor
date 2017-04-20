require 'rails_helper'

RSpec.describe User, type: :model do

  describe "user model should respond to these methods" do
    it { is_expected.to respond_to(:username) }
    it { is_expected.to respond_to(:email) }
    it { is_expected.to respond_to(:username) }
    it { is_expected.to respond_to(:password) }
    it { is_expected.to respond_to(:password_confirmation) }
  end

  it "should have username email and password_digest" do
    should have_db_column(:username).of_type(:string)
    should have_db_column(:email).of_type(:string)
    should have_db_column(:password_digest).of_type(:string)
  end

  context 'validations' do

    describe "validates presence and uniqueness of username and email" do
      it { is_expected.to validate_presence_of(:username) }
      it { is_expected.to validate_uniqueness_of(:username) }
      it { is_expected.to validate_presence_of(:email) }
      it { is_expected.to validate_uniqueness_of(:email) }
    end

    describe "validates user password" do
      it { is_expected.to validate_presence_of(:password) }
      it { is_expected.to validate_presence_of(:password_confirmation) }
      it { is_expected.to validate_length_of(:password).is_at_least(6).is_at_most(20) }
      it { is_expected.to validate_confirmation_of(:password) }
    end

    # good path
    describe "create user if all attributes are presence" do
      When(:user) { User.create(username: "muhamarief", email: "arief@arief.com", password: "123123123", password_confirmation: "123123123") }
      Then { user.valid? == true }
    end

    # bad path
    describe "won't create user without username" do
      When(:user) { User.create(email: "arief@arief.com", password: "123123123", password_confirmation: "123123123") }
      Then { user.valid? == false }
    end

    describe "won't create user without email" do
      When(:user) { User.create(username: "muhamarief", password: "123123123", password_confirmation: "123123123") }
      Then { user.valid? == false }
    end

    describe "won't create user without password" do
      When(:user) { User.create(username: "muhamarief", email: "arief@arief.com") }
      Then { user.valid? == false }
    end
  end

  context 'associations' do
    it { is_expected.to have_many(:customer_reviews)}
  end


end
