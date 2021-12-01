require 'rails_helper'

RSpec.describe 'books index page' do
  it 'displays the list of authors' do
    book = Book.create!(name: 'The Eye of The World', rating: 4.5, read: true)
    book_2 = Book.create!(name: 'The Great Hunt', rating: 4.3, read: true)
    book_3 = Book.create!(name: 'The Way of Kings', rating: 4.2, read: true)
    book_4 = Book.create!(name: 'Black Prism', rating: 3.5, read: true)

    visit "/books"

    # save_and_open_page
    expect(page).to have_content(book.name)
  end
end
