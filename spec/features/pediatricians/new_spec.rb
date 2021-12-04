require 'rails_helper'

RSpec.describe 'New Pediatrician' do
  # Then I am taken to '/parents/new' where I  see a form for a new parent record
  # When I fill out the form with a new parent's attributes:
  # And I click the button "Create Parent" to submit the form
  # Then a `POST` request is sent to the '/parents' route,
  # a new parent record is created,
  # and I am redirected to the Parent Index page where I see the new Parent displayed.
  it 'can display a link to create a new Pediatrician on the index page' do

    visit '/pediatricians'

    click_link("Create New Pediatrician")

    expect(current_path).to eq('/pediatricians/new')
  end

  it 'can create a new Pediatrician' do

    visit '/pediatricians/new'

    fill_in('Name', with: 'Jeff Lebowksi')
    fill_in('Office', with: 'Lucky Strike Bowling Alley')
    fill_in('years_practicing', with: 12)
    check('accepting_patients')

    click_button("Create Pediatrician")
    expect(current_path).to eq('/pediatricians')
    expect(page).to have_content('Jeff Lebowksi')
    expect(page).to have_content('Lucky Strike Bowling Alley')
    expect(page).to have_content("12")
    expect(page).to have_content("true")
  end
end
