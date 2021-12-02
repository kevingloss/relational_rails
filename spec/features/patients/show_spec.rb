require 'rails_helper'

RSpec.describe 'Patients show page' do
  it 'displays the attributes of a patient' do
    pediatrician = Pediatrician.create!(name: 'Bob Barker', office: '123 Fake Street', years_practicing: 15, accepting_patients: true)
    baby = Patient.create!(name: 'Elora Mielke', age_in_months: 2, full_term_birth: true, pediatrician_id: pediatrician.id)

    visit "/patients/#{baby.id}"

    expect(page).to have_content(baby.name)
    expect(page).to have_content(baby.age_in_months)
    expect(page).to have_content(baby.full_term_birth)
    expect(page).to have_content(baby.pediatrician_id)
  end
end
