require 'rails_helper'
# As a visitor
# When I visit a Child Show page
# Then I see a link to update that Child "Update Child"
# When I click the link
# I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
# When I click the button to submit the form "Update Child"
# Then a `PATCH` request is sent to '/child_table_name/:id',
# the child's data is updated,
# and I am redirected to the Child Show page where I see the Child's updated information

RSpec.describe 'Updating a Patient' do
  before :each do
    @pediatrician = Pediatrician.create!(name: 'Bob Barker', office: '123 Fake Street', years_practicing: 15, accepting_patients: true)
    @baby = Patient.create!(name: 'Elora Mielke', age_in_months: 2, full_term_birth: true, pediatrician_id: @pediatrician.id)
  end

  it 'can link to the update form' do

    visit "/patients/#{@baby.id}"

    click_link 'Update Information'

    expect(current_path).to eq("/patients/#{@baby.id}/edit")
  end

  it 'allows for attributes to be updated' do

    visit "/patients/#{@baby.id}/edit"

    fill_in('Name', with: 'Baby Boo' )
    fill_in('age_in_months', with: 11 )
    check('full_term_birth')

    click_button("Submit")
    expect(current_path).to eq("/patients/#{@baby.id}")
    expect(page).to have_content('Baby Boo')
    expect(page).to have_content('11')
    expect(page).to have_content('true')
  end
end
