require 'solidus_braintree_helper'

RSpec.describe "viewing the configuration interface", type: :feature do
  stub_authorization!

  # Regression to ensure this page still renders on old versions of solidus
  it "doesn't raise any errors due to unavailable route helpers" do
    visit "/solidus_braintree/configurations/list"
    expect(page).to have_content("Braintree Configurations")
  end

  # Regression to ensure this page renders on Solidus 2.4
  it "doesn't raise any errors due to unavailable preference field partial" do
    Rails.application.config.spree.payment_methods << SolidusBraintree::Gateway
    Spree::PaymentMethod.create!(
      type: 'SolidusBraintree::Gateway',
      name: 'Braintree Payments'
    )
    visit '/admin/payment_methods'
    page.find('a[title="Edit"]').click
    expect(page).to have_field 'Name', with: 'Braintree Payments'
  end
end
