feature 'view listings' do
  scenario 'home page has a way to add listings' do
    visit '/'
    expect(page).to have_button 'Add listing!'
  end

  scenario 'home page has a way to view listings' do
    visit '/'
    expect(page).to have_button 'View listings!'
  end
end
