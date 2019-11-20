feature 'Landlord registered' do
    scenario 'you can sign up to a page' do 
        visit('/landlord/register')
        fill_in 'first_name',with: 'John' 
        fill_in 'last_name',with: 'Smith'
        fill_in 'email_address',with: 'smith@isSoCool.co.uk'
        fill_in 'user_name',with: 'SmithCool'
        fill_in 'password',with: 'RobertNeedsAHoliday'
        click_button 'submit'
        expect(page).to have_content  "Thank you for Signing Up :)"
    end 
end 


