require 'rails_helper'

RSpec.describe 'destroy a book' do
  describe 'from the book show page' do
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

    it 'has a delete link and redirects to the index' do
      visit "/books/#{@book.id}"
      click_link "Delete #{@book.name}"

      expect(current_path).to eq("/books")
    end

    it 'destroys the book' do
      visit "/books/#{@book.id}"

      expect(page).to have_content(@book.name)
      expect(page).to have_content(@book.rating)
      expect(page).to have_content(@book.read)

      click_link "Delete #{@book.name}"

      expect(page).to_not have_content(@book.name)
    end
  end
end
