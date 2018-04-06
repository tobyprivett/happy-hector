require 'rails_helper'

describe 'User logs in' do
  before { enable_omniauth_user }

  scenario 'in general' do
    visit('/')
    click_on('Sign in')
    expect(page).to have_css('.login-details', text: 'Alice')

    click_on('Sign out')
    expect(page).to have_link('Sign in', href: '/auth/freeagent_auth/')
  end

  scenario 'when the session exists but the access token has expired'
end
