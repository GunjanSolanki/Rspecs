require 'rails_helper'

describe 'Homepage' do 
  it 'shows login form' do 
    visit root_url
    expect(page).to have_content 'Login'
  end
end