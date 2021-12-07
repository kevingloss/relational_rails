require 'rails_helper'

RSpec.describe 'Patients show page' do
  before :each do
    @pediatrician = Pediatrician.create!(name: 'Bob Barker', office: '123 Fake Street', years_practicing: 15, accepting_patients: true)
    @baby = Patient.create!(name: 'Elora Mielke', age_in_months: 2, full_term_birth: true, pediatrician_id: @pediatrician.id)

      visit "/patients/#{@baby.id}"
  end

  it 'displays the attributes of a patient' do

    expect(page).to have_content(@baby.name)
    expect(page).to have_content(@baby.age_in_months)
    expect(page).to have_content(@baby.full_term_birth)
    expect(page).to have_content(@baby.pediatrician_id)
  end

  it 'displays a link to take the user to the Pediatricians Index' do

    click_on "Pediatricians"

    expect(current_path).to eq('/pediatricians')
  end

  it 'displays a link to take the user to the Patient Index' do

    click_on "Patients"

    expect(current_path).to eq('/patients')
  end

  it 'can delete a patients' do

    click_button "Delete This Patient"

    expect(current_path).to eq('/patients')

    visit "/patients"

    expect(page).to_not have_content(@baby.name)
  end
end
