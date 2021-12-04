require 'rails_helper'

RSpec.describe 'edit a book' do
  describe 'when I visit a book show page' do
    let (:author) {Author.create!(name: 'Robert Jordan', alive: false, age: 58)}
    let (:book) {author.books.create!(name: 'The Eye of The World', rating: 4.5, read: true)}

    it 'has a link to update the book' do
      visit "/books/#{book.id}"

      click_link "Update Book"

      expect(current_path).to eq("/books/#{book.id}/edit")
    end

    it 'can edit a books attributes' do
      visit "/books/#{book.id}/edit"

      fill_in("Name", with: "The Eye of The World")
      fill_in("Rating", with: 4.7)
      check("Read")

      click_button "Update Book"

      expect(current_path).to eq("/books/#{book.id}")
      expect(page).to have_content("The Eye of The World")
      expect(page).to have_content("Rating: 4.7")
      expect(page).to have_content("Read: true")
    end
  end
end
