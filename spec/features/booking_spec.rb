feature "Booking" do
  before(:each) do
    create_listing
  end

  scenario "making a booking" do
    fill_in 'checkin_1', with: '12-12-19'
    fill_in 'checkout_1', with: '15-12-19'
    click_on 'Submit'
    expect(page).to have_content('Thanks for booking')
  end

  after(:each) do
    Listings.destroy
  end
end
