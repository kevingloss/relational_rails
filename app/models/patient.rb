class Patient < ApplicationRecord
  belongs_to :pediatrician

  def self.full_term?
    select do |baby|
       baby.full_term_birth == true
    end
  end

  def self.sort_by_age(age)
    where("age_in_months > #{age}")
  end
end
