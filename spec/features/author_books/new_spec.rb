require 'rails_helper'

RSpec.describe 'author book create' do
  let (:author) {Author.create!(name: 'Robert Jordan', alive: false, age: 58)}
  let (:book) {author.books.create!(name: 'The Eye of The World', rating: 4.5, read: true)}
  let (:book_2) {author.books.create!(name: 'The Great Hunt', rating: 4.3, read: true)}

  describe 'from the authors books index page' do
    it 'links to new book page' do
      visit "/authors/#{author.id}/books"

      click_link "Create Book"

      expect(current_path).to eq("/authors/#{author.id}/books/new")
    end

    it 'can create a new book for the author' do
      visit "/authors/#{author.id}/books/new"

      fill_in("Name", with: "The Dragon Reborn")
      fill_in("Rating", with: 4.6)
      check("Read")

      click_button "Create Book"

      expect(current_path).to eq("/authors/#{author.id}/books")
      expect(page).to have_content("The Dragon Reborn")
      expect(page).to have_content("Rating: 4.6")
      expect(page).to have_content("Read: true")
    end
  end
end
