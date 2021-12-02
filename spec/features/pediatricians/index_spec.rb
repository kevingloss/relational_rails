require 'rails_helper'

RSpec.describe 'Pediatrician index page' do
  it 'displays a list of pediatricians' do
    pediatrician = Pediatrician.create!(name: 'Bob Barker', office: '123 Fake Street', years_practicing: 15, accepting_patients: true)
    pediatrician_2 = Pediatrician.create!(name: 'Roberto Guauguau', office: '123 Seaseme Street', years_practicing: 10, accepting_patients: false)

    visit "/pediatricians"

    expect(page).to have_content(pediatrician.name)
  end
end
