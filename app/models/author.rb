class Author < ApplicationRecord
  has_many :books, dependent: :destroy
  validates_presence_of :name, :age

  def total_books
    books.count
  end

  def self.desc_order
    order(created_at: :desc)
  end

  def alphabetize
    books.order(:name)
  end
end
