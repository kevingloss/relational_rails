class Pediatrician < ApplicationRecord
  has_many :patients

  def self.desc_order
    order(created_at: :desc)
  end
end
