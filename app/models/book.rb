class Book < ApplicationRecord
  belongs_to :author

  def self.read?
    all.select do |book|
      book.read
    end
  end
end
