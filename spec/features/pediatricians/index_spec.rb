require 'rails_helper'

RSpec.describe 'Pediatrician index page' do
  describe 'display' do
    before :each do
      @pediatrician = Pediatrician.create!(name: 'Bob Barker', office: '123 Fake Street', years_practicing: 15, accepting_patients: true)
      @pediatrician_2 = Pediatrician.create!(name: 'Roberto Guauguau', office: '123 Seaseme Street', years_practicing: 10, accepting_patients: false)
      @pediatrician_3 = Pediatrician.create!(name: 'Barbaro Baubau', office: '123 Seaseme Street', years_practicing: 10, accepting_patients: false)

        visit "/pediatricians"
    end

    it 'displays a list of pediatricians' do

      expect(page).to have_content(@pediatrician.name)
      expect(page).to have_content(@pediatrician_2.name)
      expect(page).to have_content(@pediatrician_3.name)
    end

    it 'displays the Pediatricians in order of creation, first to last' do

      expect(@pediatrician_3.name).to appear_before(@pediatrician_2.name)
      expect(@pediatrician_2.name).to appear_before(@pediatrician.name)
    end

    it 'displays a link to take the user to the Pediatricians Index' do

      click_on "Pediatricians"

      expect(current_path).to eq('/pediatricians')
    end

    it 'displays a link to take the user to the Patient Index' do

      click_on "Patients"

      expect(current_path).to eq('/patients')
    end
  end

  describe 'it displays an edit button' do
    it 'displays a link that lets the user edit a specific Pediatrician' do
      pediatrician = Pediatrician.create!(name: 'Bob Barker', office: '123 Fake Street', years_practicing: 15, accepting_patients: true)
      visit '/pediatricians'

      click_on('Edit Information', :match => :prefer_exact)
      expect(current_path).to eq("/pediatricians/#{pediatrician.id}/edit")
    end

    it 'can delete a Pediatrician' do
      pediatrician = Pediatrician.create!(name: 'Bob Barker', office: '123 Fake Street', years_practicing: 15, accepting_patients: true)
      visit "/pediatricians"

      click_button "Delete this Pediatrician"
      expect(current_path).to eq('/pediatricians')

      visit '/pediatricians'

      expect(page).to_not have_content(pediatrician.name)
    end
  end
end
