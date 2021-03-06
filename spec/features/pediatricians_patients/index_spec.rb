require 'rails_helper'

RSpec.describe 'Pediatricians Patients Index' do
  before :each do
    @pediatrician = Pediatrician.create!(name: 'Bob Barker', office: '123 Fake Street', years_practicing: 15, accepting_patients: true)

    @baby = Patient.create!(name: 'Elora Mielke', age_in_months: 2, full_term_birth: true, pediatrician_id: @pediatrician.id)
    @baby_2 = Patient.create!(name: 'Ezra Bridger', age_in_months: 8, full_term_birth: true, pediatrician_id: @pediatrician.id)
    @baby_3 = Patient.create!(name: 'Anakin Skywalker', age_in_months: 5, full_term_birth: false, pediatrician_id: @pediatrician.id)

    visit "/pediatricians/#{@pediatrician.id}/patients"
  end

  it 'displays a Pediatricians patients' do

    expect(page).to have_content(@baby.name)
    expect(page).to have_content(@baby.age_in_months)
    expect(page).to have_content(@baby.full_term_birth)
  end

  it 'displays a link to take the user to the Pediatricians Index' do

    click_on "Pediatricians"

    expect(current_path).to eq('/pediatricians')
  end

  it 'displays a link to take the user to the Patient Index' do

    click_on "Patients"

    expect(current_path).to eq('/patients')
  end

  it 'provides a link to sort alphabetically' do

    click_link "Sort Patients Alphabetically"

    expect(current_path).to eq("/pediatricians/#{@pediatrician.id}/patients")
  end

  it 'sorts patients alphabetically' do

    click_link "Sort Patients Alphabetically"

    expect(@baby_3.name).to appear_before(@baby.name)
    expect(@baby.name).to appear_before(@baby_2.name)
  end


  it 'displays a link that lets the user edit a specific Pediatrician' do

    click_on('Edit Information', :match => :prefer_exact)
    expect(current_path).to eq("/patients/#{@baby.id}/edit")
  end

  it 'displays a field that lets the user filter results' do

    fill_in(:query_by, with: 3)
    click_on("Filter Results", :match => :prefer_exact)

    expect(current_path).to eq("/pediatricians/#{@pediatrician.id}/patients")

    expect(page).to have_content(@baby_2.name)
    expect(page).to have_content(@baby_3.name)
    expect(page).to_not have_content(@baby.name)
  end

  it 'can delete a Patient' do

    click_on("Delete this Patient", :match => :prefer_exact)
    expect(current_path).to eq('/patients')

    visit '/patients'

    expect(page).to_not have_content(@baby_3.name)
  end
end
