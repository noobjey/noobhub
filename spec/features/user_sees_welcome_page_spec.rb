require 'rails_helper'

describe 'home page' do

  it 'should have login button' do
    visit root_path

    page.has_button?("Login with Github")
  end

  it 'should allow you to login' do
    visit root_path

    click_button("Login with Github")

    # fill out login info?

    expect(page).to have_content("noobjey's Dashboard")
  end
end
