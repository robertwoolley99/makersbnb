feature 'adding property' do
  after(:each) do
    Listings.destroy
  end
  
  scenario 'you can visit the add listings page' do
    visit ('/')
    click_button 'Add listing!'
    expect(page).to have_content 'Add a listing'
  end
end
