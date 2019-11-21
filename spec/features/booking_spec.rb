feature 'Booking' do
  before(:each) do
    create_listing
  end

  after(:each) do
    Listing.destroy
  end

  scenario 'making a booking' do
    fill_in 'check_in', with: '12-12-19'
    fill_in 'check_out', with: '15-12-19'
    click_on 'Submit'
    expect(page).to have_content('Thanks for booking')
  end

  # scenario 'booking an unavailable date' do
    # # make something unavailable
    # # try and make a booking
    # click_on 'Submit'
    # expect(page).to have_content('Thanks for booking')
  # end
end
