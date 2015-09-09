require 'rails_helper'

describe 'View the dashboard' do
  before do
    # Short circuit OmniAuth requests to use a mock authentication hash
    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
            provider:    "github",
            uid:         "8325508",
            info:        {
              nickname: "noobjey",
              email:    "",
              name:     "Jason Wright",
              image:    "https://avatars.githubusercontent.com/u/8325508?v=3",
              urls:     {
                GitHub: "https://github.com/noobjey",
                Blog:   ""
              }
            },
            credentials: {
              token:   "fd11c636d80d2326f9b1a15bbfb92d09efcebbfc",
              expires: false
            }})

    Rails.application.env_config["omniauth.auth"] =
      OmniAuth.config.mock_auth[:github]
  end

  it 'should allow you to login' do
    visit root_path

    click_button("Login with Github")

    expect(page).to have_content("Jason Wright's Dashboard")
  end
end
