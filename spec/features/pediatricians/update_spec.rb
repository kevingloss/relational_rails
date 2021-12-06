require 'rails_helper'

RSpec.describe 'Updating a Pediatrician' do
  before :each do
    @pediatrician = Pediatrician.create!(name: 'Bob Barker', office: '123 Fake Street', years_practicing: 15, accepting_patients: true)
    @baby = Patient.create!(name: 'Elora Mielke', age_in_months: 2, full_term_birth: true, pediatrician_id: @pediatrician.id)
  end

  # Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
  # When I fill out the form with updated information
  # And I click the button to submit the form
  # Then a `PATCH` request is sent to '/parents/:id',
  # the parent's info is updated,
  # and I am redirected to the Parent's Show page where I see the parent's updated info

  it 'can link to the edit page from a specific pediatricians page' do

    visit "/pediatricians/#{@pediatrician.id}"

    click_link "Update Info"

    expect(current_path).to eq("/pediatricians/#{@pediatrician.id}/edit")
  end

  it 'creates a patch request and updates the Pediatricians info' do

    visit "/pediatricians/#{@pediatrician.id}/edit"

    fill_in(:Office, with: 'North Hollywood Ave')
    fill_in(:years_practicing, with: 8)
    check(:accepting_patients)

    click_button("Submit")
    expect(current_path).to eq("/pediatricians/#{@pediatrician.id}")
    expect(page).to have_content('North Hollywood Ave')
    expect(page).to have_content('8')
    expect(page).to have_content('true')
  end
end
