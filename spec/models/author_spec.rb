require 'rails_helper'

RSpec.describe Author, type: :model do
  it {should have_many :books}
  it {should validate_presence_of :name}
  it {should validate_presence_of :age}

  describe 'instance methods' do
    before :each do
      @author = Author.create!(name: 'Robert Jordan', alive: false, age: 58)
      @author_2 = Author.create!(name: 'Brandon Sanderson', alive: true, age: 45)
      @author_3 = Author.create!(name: 'Brent Weeks', alive: true, age: 44)

      @book = @author.books.create!(name: 'The Eye of The World', rating: 4.5, read: true)
      @book_2 = @author.books.create!(name: 'The Great Hunt', rating: 4.3, read: true)
      @book_3 = @author_2.books.create!(name: 'The Way of Kings', rating: 4.2, read: true)
      @book_4 = @author_3.books.create!(name: 'Black Prism', rating: 3.5, read: true)
      @book_5 = @author_3.books.create!(name: 'Night Angel', rating: 3.8, read: true)
    end

    it 'can sort the authors in descending order by created at' do
      expect(Author.desc_order).to eq([@author_3, @author_2, @author])
    end

    it 'can count the number of books for an author' do
      expect(@author.total_books).to eq(2)
      expect(@author_2.total_books).to eq(1)
      expect(@author_3.total_books).to eq(2)
    end
  end
end
