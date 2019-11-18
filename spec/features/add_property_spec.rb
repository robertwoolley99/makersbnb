feature 'adding property' do
  scenario 'you can visit the add listings page' do
    visit ('/')
    click_button 'Add listing!'
    expect(page).to have_content 'Add a listing'
  end

  scenario 'you can enter a listing with details' do
    visit ('/spaces/new')
    fill_in 'location', with: 'London'
    fill_in 'price_per_night', with: '100'
    fill_in 'dates_available', with: 'December'
    fill_in 'owner_name', with: 'J Bloggs'
    fill_in 'contact_details', with: 'jo@bloggs.com'
    fill_in 'description', with: 'Lovely flat to stay in'
    click_on 'submit'
    expect(page).to have_content 'Listing added OK'
  end
  
end
