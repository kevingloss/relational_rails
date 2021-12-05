require 'rails_helper'

RSpec.describe 'Pediatricians Patients Index' do
  before :each do
    @pediatrician = Pediatrician.create!(name: 'Bob Barker', office: '123 Fake Street', years_practicing: 15, accepting_patients: true)
    @baby = Patient.create!(name: 'Elora Mielke', age_in_months: 2, full_term_birth: true, pediatrician_id: @pediatrician.id) 
  end

  it 'displays a Pediatricians patients' do

    visit "/pediatricians/#{@pediatrician.id}/patients"

    expect(page).to have_content(@baby.name)
    expect(page).to have_content(@baby.age_in_months)
    expect(page).to have_content(@baby.full_term_birth)
  end

  it 'displays a link to take the user to the Pediatricians Index' do

    visit "/pediatricians/#{@pediatrician.id}/patients"

    click_on "Pediatricians"

    expect(current_path).to eq('/pediatricians')
  end

  it 'displays a link to take the user to the Patient Index' do

    visit "/pediatricians/#{@pediatrician.id}/patients"

    click_on "Patients"

    expect(current_path).to eq('/patients')
  end
end
