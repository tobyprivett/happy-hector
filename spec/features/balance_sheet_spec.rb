require 'rails_helper'

describe 'User views balance sheet' do
  before { login_as_omniauth_user }

  scenario 'in general' do
    visit('/')
    expect(page).to have_css('.retained-profit', text: '£12,345.00')
  end
end
