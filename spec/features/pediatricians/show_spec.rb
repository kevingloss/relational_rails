require 'rails_helper'

RSpec.describe 'Pediatrician show page' do
  before :each do
    @pediatrician = Pediatrician.create!(name: 'Bob Barker', office: '123 Fake Street', years_practicing: 15, accepting_patients: true)
    @pediatrician_2 = Pediatrician.create!(name: 'Roberto Guauguau', office: '123 Seaseme Street', years_practicing: 10, accepting_patients: false)

    @baby = Patient.create!(name: 'Elora Mielke', age_in_months: 2, full_term_birth: true, pediatrician_id: @pediatrician.id)
    @baby_2 = Patient.create!(name: 'Ezra Bridger', age_in_months: 8, full_term_birth: true, pediatrician_id: @pediatrician.id)
    @baby_3 = Patient.create!(name: 'Kanan Jarrus', age_in_months: 11, full_term_birth: false, pediatrician_id: @pediatrician_2.id)
  end

  it 'displays a Pediatrician and its attributes' do

    visit "/pediatricians/#{@pediatrician.id}"

    expect(page).to have_content(@pediatrician.name)
    expect(page).to have_content(@pediatrician.office)
    expect(page).to have_content(@pediatrician.years_practicing)
    expect(page).to have_content(@pediatrician.accepting_patients)
  end

  it 'displays the total number of patients a Pediatrician has' do

    visit "/pediatricians/#{@pediatrician.id}"

    expect(page).to have_content("Total Number of Patients: 2")

    visit "/pediatricians/#{@pediatrician_2.id}"

    expect(page).to have_content("Total Number of Patients: 1")
  end 
end
