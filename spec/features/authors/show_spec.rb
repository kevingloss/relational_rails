require 'rails_helper'

RSpec.describe 'authors show page', type: :feature do
  describe 'when I visit author/:author_id' do
    it 'displays the author and attributes' do
      author = Author.create!(name: 'Robert Jordan', alive: false, age: 58)
      author_2 = Author.create!(name: 'Brandon Sanderson', alive: true, age: 45)
      author_3 = Author.create!(name: 'Brent Weeks', alive: true, age: 44)

      visit "authors/#{author.id}"

      expect(page).to have_content(author.name)
      expect(page).to have_content(author.alive)
      expect(page).to have_content(author.age)
      expect(page).to have_content(author.created_at)
      expect(page).to have_content(author.updated_at)
    end
  end
end
