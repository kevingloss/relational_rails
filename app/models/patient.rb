class Patient < ApplicationRecord
  belongs_to :pediatrician
  validates_presence_of :name, :age_in_months

  def self.full_term?
    where(full_term_birth: true)
  end

  def self.sort_by_age(age)
    where("age_in_months > #{age}")
  end
end
