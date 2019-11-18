feature 'visit homepage' do
  scenario 'home page has a link to add listings' do
    visit '/'
    expect(page).to have_button 'Add listing!'
  end

  scenario 'home page has a link to view listings' do
    visit '/'
    expect(page).to have_button 'View listings!'
  end
end

