require 'spec_helper'

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


