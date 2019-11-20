feature 'viewing listings' do
  scenario 'redirect from home page works' do
    visit '/'
    click_on "View listings!"
    expect(page).to have_current_path('/spaces')
  end

  scenario 'the listings page has all the listing properties' do
    create_listing
    expect(page).to have_content('Description:')
    expect(page).to have_content('Price per night:')
    expect(page).to have_content('Location:')
    expect(page).to have_content('Available:')
    expect(page).to have_content('Owner:')
    expect(page).to have_content('Contact details:')
  end
end
