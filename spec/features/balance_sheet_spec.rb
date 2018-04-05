require 'rails_helper'

describe 'User views balance sheet' do
  before { login_as_omniauth_user }

  scenario 'in general' do
    visit('/')
    expect(page).to have_css('.retained-profit', text: '£32,670.00')
    expect(page).to have_css('.bank_balance', text: '£18,756.42')
    expect(page).to have_css('.bank_balance', text: '£30,022.58')
    expect(page).to have_css('.contact_name', text: 'Api Test Inc')
    expect(page).to have_css('.due_value', text: '£1,020.00')
  end
end
