require 'rails_helper'

RSpec.describe 'Pediatrician show page' do
  it 'displays a Pediatrician and its attributes' do
    pediatrician = Pediatrician.create!(name: 'Bob Barker', office: '123 Fake Street', years_practicing: 15, accepting_patients: true)
    pediatrician_2 = Pediatrician.create!(name: 'Roberto Guauguau', office: '123 Seaseme Street', years_practicing: 10, accepting_patients: false)

    visit "/pediatricians/#{pediatrician.id}"

    expect(page).to have_content(pediatrician.name)
    expect(page).to have_content(pediatrician.office)
    expect(page).to have_content(pediatrician.years_practicing)
    expect(page).to have_content(pediatrician.accepting_patients)
  end
end
