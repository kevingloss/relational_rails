require 'rails_helper'

RSpec.describe 'authors index page' do
  it 'displays the list of authors' do
    author = Author.create!(name: 'Robert Jordan', alive: false, age: 58)
    author_2 = Author.create!(name: 'Brandon Sanderson', alive: true, age: 45)
    author_3 = Author.create!(name: 'Brent Weeks', alive: true, age: 44)

    visit "/authors"

    # save_and_open_page
    expect(page).to have_content(author.name)
  end
end
