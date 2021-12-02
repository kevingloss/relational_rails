require 'rails_helper'

RSpec.describe 'authors show page' do
  it 'displays the author and attributes' do
    author = Author.create!(name: 'Robert Jordan', alive: false, age: 58)
    author_2 = Author.create!(name: 'Brandon Sanderson', alive: true, age: 45)
    author_3 = Author.create!(name: 'Brent Weeks', alive: true, age: 44)

    visit "authors/#{author.id}"

    expect(page).to have_content(author.name)
    expect(page).to have_content(author.alive)
    expect(page).to have_content(author.age)

RSpec.describe 'authors show page', type: :feature do
  describe 'when I visit author/:author_id' do

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

    it 'displays the author and attributes' do
      visit "authors/#{@author.id}"

      expect(page).to have_content(@author.name)
      expect(page).to have_content(@author.alive)
      expect(page).to have_content(@author.age)
      expect(page).to have_content(@author.created_at)
      expect(page).to have_content(@author.updated_at)
    end

    it 'displays the count of books associated with the author' do
      visit "authors/#{@author_3.id}"

      expect(page).to have_content("Total Books: 2")
    end

    it 'has a link to the authors index' do
      visit "/authors/#{@author.id}"

      click_on "Authors"

      expect(current_path).to eq("/authors")
    end
  end
end
