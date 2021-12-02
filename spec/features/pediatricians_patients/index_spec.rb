require 'rails_helper'

RSpec.describe 'Pediatricians Patients Index' do
  it 'displays a Pediatricians patients' do
    pediatrician = Pediatrician.create!(name: 'Bob Barker', office: '123 Fake Street', years_practicing: 15, accepting_patients: true)
    pediatrician_2 = Pediatrician.create!(name: 'Roberto Guauguau', office: '123 Seaseme Street', years_practicing: 10, accepting_patients: false)
    baby = Patient.create!(name: 'Elora Mielke', age_in_months: 2, full_term_birth: true, pediatrician_id: pediatrician.id)

    visit "/pediatrician/#{pediatrician.id}/patients"

    expect(page).to have_content(baby.name)
    expect(page).to have_content(baby.age_in_months)
    expect(page).to have_content(baby.full_term_birth)
  end
end
