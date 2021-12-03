require 'rails_helper'

RSpec.describe 'books show page' do
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

  describe 'when I visit a book show page' do
    it 'displays the book and attributes' do
      visit "books/#{@book.id}"

      # save_and_open_page
      expect(page).to have_content(@book.name)
      expect(page).to have_content(@book.rating)
      expect(page).to have_content(@book.read)
      expect(page).to have_content(@book.created_at)
      expect(page).to have_content(@book.updated_at)
    end

    it 'has a link to the authors index' do
      visit "/books/#{@book.id}"

      click_on "Authors"

      expect(current_path).to eq("/authors")
    end

    it 'has a link to the books index' do
      visit "/books/#{@book.id}"

      click_on "Books"

      expect(current_path).to eq("/books")
    end
  end
end
