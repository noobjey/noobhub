require 'rails_helper'

describe 'home page' do


  it 'should have login button' do
    visit root_path

    page.has_button?("Login with Github")
  end

end
