require 'rails_helper'
# As a visitor
# When I visit a Parent Childs Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed

RSpec.describe 'New Patient for Pediatrician' do
  before :each do
    @pediatrician = Pediatrician.create!(name: 'Bob Barker', office: '123 Fake Street', years_practicing: 15, accepting_patients: true)
    @baby = Patient.create!(name: 'Elora Mielke', age_in_months: 2, full_term_birth: true, pediatrician_id: @pediatrician.id)
  end

  it 'Can create a new Patient for a specific pediatrician' do

    visit "/pediatricians/#{@pediatrician.id}/patients"

    click_link("Create New Patient")

    expect(current_path).to eq("/pediatricians/#{@pediatrician.id}/patients/new")
  end

  it 'displays a form to create a new Patient' do

    visit "/pediatricians/#{@pediatrician.id}/patients/new"

    fill_in('name', with: 'Walter Booskah')
    fill_in('age_in_months', with: 8)
    check('full_term_birth')

    click_button("Create Patient")
    expect(current_path).to eq("/pediatricians/#{@pediatrician.id}/patients")
    expect(page).to have_content('Walter Booskah')
    expect(page).to have_content('8')
    expect(page).to have_content('true')
  end
end
