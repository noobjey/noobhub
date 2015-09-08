require 'rails_helper'

describe 'home page' do

  it 'should display something' do
    visit root_path
    expect(page).to have_content("We are online!")
  end
end
