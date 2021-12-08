require 'rails_helper'

RSpec.describe Pediatrician do
  it {should have_many :patients}
  it {should validate_presence_of :name}
  it {should validate_presence_of :office}
  it {should validate_presence_of :years_practicing}

  describe 'instance methods' do
    before :each do
      @pediatrician = Pediatrician.create!(name: 'Bob Barker', office: '123 Fake Street', years_practicing: 15, accepting_patients: true)
      @pediatrician_2 = Pediatrician.create!(name: 'Roberto Guauguau', office: '123 Seaseme Street', years_practicing: 10, accepting_patients: false)
      @pediatrician_3 = Pediatrician.create!(name: 'Barbaro Baubau', office: '123 Seaseme Street', years_practicing: 10, accepting_patients: false)

      @baby = Patient.create!(name: 'Elora Mielke', age_in_months: 2, full_term_birth: true, pediatrician_id: @pediatrician.id)
      @baby_2 = Patient.create!(name: 'Ezra Bridger', age_in_months: 8, full_term_birth: true, pediatrician_id: @pediatrician.id)
      @baby_3 = Patient.create!(name: 'Kanan Jarrus', age_in_months: 11, full_term_birth: false, pediatrician_id: @pediatrician_2.id)
    end

    it 'can order a list of pediatricians by most recent creation date' do

      expect(Pediatrician.desc_order).to eq([@pediatrician_3, @pediatrician_2, @pediatrician])
    end

    it 'displays the total number of patients a Pediatrician has' do

      expect(@pediatrician.number_of_patients).to eq(2)
      expect(@pediatrician_2.number_of_patients).to eq(1)
    end
  end
end
