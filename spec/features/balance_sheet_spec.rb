require 'rails_helper'

describe 'User views balance sheet' do
  before { login_as_omniauth_user }

  scenario 'in general' do
    visit('/')
    click_on('Balance Sheet')

    expect(page).to have_css('.bank_balance', text: '£18,756')
    expect(page).to have_css('.bank_balance', text: '£30,023')
    expect(page).to have_css('.contact_name', text: 'Api Test Inc')
    expect(page).to have_css('.due_value', text: '£1,020')
    expect(page).to have_css('.adjustments', text: '£1,381')
    expect(page).to have_css('.corporation_tax_owed', text: '-£13,476')
    expect(page).to have_css('.vat_owed', text: '-£2,271')
    expect(page).to have_css('.retained-profit', text: '£32,670')
  end
end
