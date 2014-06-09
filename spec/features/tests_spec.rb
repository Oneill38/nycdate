require 'spec_helper'

describe "sign in" do
  let(:user) {FactoryGirl.create(:user)}
  it"should allow you to sign up" do
    visit root_path
    click_on 'Sign up/Login'
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    fill_in "Password confirmation", with: user.password
    click_on 'Sign up'
    expect(current_path).to eq "/users"
  end
end

describe "the profile" do
  it "should show you your profile" do
    visit root_path
    click_on 'Profile'
    page.has_content?('Profile')
  end
end

describe Concert do
  it {should validate_presence_of(:title)}
  it {should validate_presence_of(:date)}
end

describe Search do
  it {should validate_presence_of(:title)}
  it {should validate_presence_of(:start_time)}
end


