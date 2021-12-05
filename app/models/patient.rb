class Patient < ApplicationRecord
  belongs_to :pediatrician

  def self.full_term?
    select do |baby|
       baby.full_term_birth == true
    end
  end

end
