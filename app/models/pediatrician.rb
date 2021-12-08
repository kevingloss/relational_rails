class Pediatrician < ApplicationRecord
  has_many :patients, dependent: :destroy
  validates_presence_of :name, :office, :years_practicing

  def self.desc_order
    order(created_at: :desc)
  end

  def number_of_patients
    self.patients.count
  end
end
