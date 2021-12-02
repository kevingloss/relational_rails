require 'rails_helper'

RSpec.describe 'Patients index page' do
  it 'displays a list of patients' do
    pediatrician = Pediatrician.create!(name: 'Bob Barker', office: '123 Fake Street', years_practicing: 15, accepting_patients: true)
    baby = Patient.create!(name: 'Elora Mielke', age_in_months: 2, full_term_birth: true, pediatrician_id: pediatrician.id)

    visit '/patients'

    expect(page).to have_content(baby.name)
  end
end
