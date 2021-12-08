require 'rails_helper'

RSpec.describe Patient, type: :model do
  it {should belong_to :pediatrician}
  it {should validate_presence_of :name}
  it {should validate_presence_of :age_in_months}

  before :each do
    @pediatrician = Pediatrician.create!(name: 'Bob Barker', office: '123 Fake Street', years_practicing: 15, accepting_patients: true)
    @pediatrician_2 = Pediatrician.create!(name: 'Roberto Guauguau', office: '123 Seaseme Street', years_practicing: 10, accepting_patients: false)
    @pediatrician_3 = Pediatrician.create!(name: 'Barbaro Baubau', office: '123 Seaseme Street', years_practicing: 10, accepting_patients: false)

    @baby = Patient.create!(name: 'Elora Mielke', age_in_months: 2, full_term_birth: true, pediatrician_id: @pediatrician.id)
    @baby_2 = Patient.create!(name: 'Ezra Bridger', age_in_months: 8, full_term_birth: true, pediatrician_id: @pediatrician.id)
    @baby_3 = Patient.create!(name: 'Kanan Jarrus', age_in_months: 11, full_term_birth: false, pediatrician_id: @pediatrician_2.id)
  end

  it 'can return a list of Patients born at full term' do

    expect(Patient.full_term?).to eq([@baby, @baby_2])
  end

  it 'can return a list of Patients over a given age' do

    expect(Patient.sort_by_age(3)).to eq([@baby_2, @baby_3])
  end
end
