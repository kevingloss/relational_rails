require 'rails_helper'

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
