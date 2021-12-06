class Book < ApplicationRecord
  belongs_to :author

  def self.read?
    where(read: true)
  end
end
