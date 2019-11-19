def create_listing
  visit ('/spaces/new')
  fill_in 'location', with: 'London'
  fill_in 'price_per_night', with: '100'
  fill_in 'dates_available', with: 'December'
  fill_in 'owner_name', with: 'J Bloggs'
  fill_in 'contact_details', with: 'jo@bloggs.com'
  fill_in 'description', with: 'Lovely flat to stay in'
  click_on 'submit'
end
