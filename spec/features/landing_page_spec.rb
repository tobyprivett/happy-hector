require 'rails_helper'

describe 'User visits the landing page' do
  before do
    login_as_omniauth_user
    visit('/')
  end

  scenario 'views their login details' do
    expect(page).to have_css('.login-details', text: 'Alice')
  end
end
