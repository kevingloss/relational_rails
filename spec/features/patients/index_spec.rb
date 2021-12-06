require 'rails_helper'

RSpec.describe 'Patients index page' do
  before :each do
    @pediatrician = Pediatrician.create!(name: 'Bob Barker', office: '123 Fake Street', years_practicing: 15, accepting_patients: true)
    @pediatrician_2 = Pediatrician.create!(name: 'Roberto Guauguau', office: '123 Seaseme Street', years_practicing: 10, accepting_patients: false)
    @pediatrician_3 = Pediatrician.create!(name: 'Barbaro Baubau', office: '123 Seaseme Street', years_practicing: 10, accepting_patients: false)

    @baby = Patient.create!(name: 'Elora Mielke', age_in_months: 2, full_term_birth: true, pediatrician_id: @pediatrician.id)
    @baby_2 = Patient.create!(name: 'Ezra Bridger', age_in_months: 8, full_term_birth: true, pediatrician_id: @pediatrician.id)
    @baby_3 = Patient.create!(name: 'Kanan Jarrus', age_in_months: 11, full_term_birth: false, pediatrician_id: @pediatrician_2.id)
  end
  it 'displays a list of patients' do


    visit '/patients'

    expect(page).to have_content(@baby.name)
    expect(page).to have_content(@baby_2.name)
  end

  it 'displays a link to take the user to the Pediatricians Index' do

    visit "/patients"

    click_on "Pediatricians"

    expect(current_path).to eq('/pediatricians')
  end

  it 'displays a link to take the user to the Patient Index' do

    visit "/patients"

    click_on "Patients"

    expect(current_path).to eq('/patients')
  end

  it 'displays only Patients who were born full-term' do

    visit '/patients'

    expect(page).to have_content(@baby.name)
    expect(page).to have_content(@baby_2.name)
    expect(page).to_not have_content(@baby_3.name)
  end

  describe 'it displays an edit button' do
    it 'displays a link that lets the user edit a specific Pediatrician' do
  
      visit '/patients'

      click_on('Edit Information', :match => :prefer_exact)
      expect(current_path).to eq("/patients/#{@baby.id}/edit")
    end
  end
end
