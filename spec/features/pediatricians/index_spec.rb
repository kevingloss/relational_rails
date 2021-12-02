require 'rails_helper'

RSpec.describe 'Pediatrician index page' do
  before :each do
    @pediatrician = Pediatrician.create!(name: 'Bob Barker', office: '123 Fake Street', years_practicing: 15, accepting_patients: true)
    @pediatrician_2 = Pediatrician.create!(name: 'Roberto Guauguau', office: '123 Seaseme Street', years_practicing: 10, accepting_patients: false)
    @pediatrician_3 = Pediatrician.create!(name: 'Barbaro Baubau', office: '123 Seaseme Street', years_practicing: 10, accepting_patients: false)
  end
  it 'displays a list of pediatricians' do

    visit "/pediatricians"

    expect(page).to have_content(@pediatrician.name)
  end

  it 'displays a sorted list of pediatricians by most recent creation date' do

    visit '/pediatricians'

    expect(@pediatrician_3.name).to appear_before(@pediatrician_2.name)
    expect(@pediatrician_2.name).to appear_before(@pediatrician.name)
  end
end
