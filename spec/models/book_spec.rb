require 'rails_helper'

RSpec.describe Book, type: :model do
  it {should belong_to :author}
  it {should validate_presence_of :name}
  it {should validate_presence_of :rating}

  before :each do
    @author = Author.create!(name: 'Robert Jordan', alive: false, age: 58)
    @author_2 = Author.create!(name: 'Brandon Sanderson', alive: true, age: 45)
    @author_3 = Author.create!(name: 'Brent Weeks', alive: true, age: 44)

    @book = @author.books.create!(name: 'The Eye of The World', rating: 4.5, read: true)
    @book_2 = @author.books.create!(name: 'The Great Hunt', rating: 4.3, read: true)
    @book_3 = @author_2.books.create!(name: 'The Way of Kings', rating: 4.2, read: true)
    @book_4 = @author_3.books.create!(name: 'The Burning White', rating: 3.5, read: false)
    @book_5 = @author_3.books.create!(name: 'Night Angel', rating: 3.8, read: true)
  end

  it 'returns all the books that have been read' do
    expect(Book.read?).to eq([@book, @book_2, @book_3, @book_5])
  end
end
