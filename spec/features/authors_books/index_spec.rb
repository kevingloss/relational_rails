require 'rails_helper'

RSpec.describe 'authors index page', type: :feature do

  before :each do
    @author = Author.create!(name: 'Robert Jordan', alive: false, age: 58)
    @author_2 = Author.create!(name: 'Brandon Sanderson', alive: true, age: 45)
    @author_3 = Author.create!(name: 'Brent Weeks', alive: true, age: 44)

    @book_2 = @author.books.create!(name: 'The Great Hunt', rating: 4.3, read: true)
    @book = @author.books.create!(name: 'The Eye of The World', rating: 4.5, read: true)
    @book_3 = @author_2.books.create!(name: 'The Way of Kings', rating: 4.2, read: true)
    @book_4 = @author_3.books.create!(name: 'Black Prism', rating: 3.5, read: true)
    @book_5 = @author_3.books.create!(name: 'Night Angel', rating: 3.8, read: true)
    @book_6 = @author.books.create!(name: 'The Dragon Reborn', rating: 4.7, read: true)
  end

  describe 'when I visit the author/:author_id/books' do
    it 'displays the list of an authors books' do
      visit "/authors/#{@author.id}/books"

      # this next command is the keywords for launchy to see the page that we are on
      # save_and_open_page
      expect(page).to have_content(@book.name)
      expect(page).to have_content(@book.rating)
      expect(page).to have_content(@book_2.read)
      expect(page).to have_content(@book_2.created_at)
      expect(page).to have_content(@book_2.updated_at)
    end

    it 'has a link to the authors index' do
      visit "/authors/#{@author.id}/books"

      click_on "Authors"

      expect(current_path).to eq("/authors")
    end

    it 'has a link to the books index' do
      visit "/authors/#{@author.id}/books"

      click_on "Books"

      expect(current_path).to eq("/books")
    end

    it 'has a link to sort the books alphabetically' do
      visit "/authors/#{@author.id}/books"

      expect(@book_2.name).to appear_before(@book.name)
      expect(@book.name).to appear_before(@book_6.name)

      click_link "Alphabetize Books"

      expect(current_path).to eq("/authors/#{@author.id}/books")
      expect(@book_6.name).to appear_before(@book.name)
      expect(@book.name).to appear_before(@book_2.name)
    end
  end
end
