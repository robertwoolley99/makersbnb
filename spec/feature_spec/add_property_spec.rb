feature 'adding property' do
  scenario 'an owner can add a property' do
    visit ('/')
    click_button 'Add listing!'
    expect(page).to have_content 'Add a listing'
  end
end