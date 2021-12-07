require 'rails_helper'

RSpec.describe 'delete authors' do
  describe 'from the author show page' do
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

    it 'has a link to delete the parent and redirect to author index' do
      visit "/authors/#{@author.id}"
      click_link "Delete #{@author.name}"

      expect(current_path).to eq("/authors")
    end

    it 'deletes the author and all their book records' do
      visit "/books"

      expect(page).to have_content(@book.name)
      expect(page).to have_content(@book_2.name)
      expect(page).to have_content(@book_6.name)

      visit "/authors/#{@author.id}"

      expect(page).to have_content(@author.name)
      expect(page).to have_content(@author.age)
      expect(page).to have_content(@author.alive)

      click_link "Delete #{@author.name}"

      expect(page).to_not have_content(@author.name)
      expect(page).to_not have_content(@author.age)
      expect(page).to_not have_content(@author.alive)

      visit "/books"

      expect(page).to_not have_content(@book.name)
      expect(page).to_not have_content(@book_2.name)
      expect(page).to_not have_content(@book_6.name)
    end
  end
end
