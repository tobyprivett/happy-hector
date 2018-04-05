require 'rails_helper'

describe 'User views balance sheet' do
  before { login_as_omniauth_user }

  scenario 'in general' do
    visit('/')
    expect(page).to have_css('.retained-profit', text: '£32,670.00')
    expect(page).to have_css('.bank_balance', text: '-£10.91')
    expect(page).to have_css('.bank_balance', text: '£290.12')
  end
end
