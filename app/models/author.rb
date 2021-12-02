class Author < ApplicationRecord
  has_many :books
  validates_presence_of :name

  def total_books
    books.count
  end

  def self.desc_order
    order(created_at: :desc)
  end
end
