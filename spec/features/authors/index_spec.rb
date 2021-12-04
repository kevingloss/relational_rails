require 'rails_helper'

RSpec.describe 'authors index page', type: :feature do
  describe 'when I visit the parent index' do
    before :each do
      @author = Author.create!(name: 'Robert Jordan', alive: false, age: 58)
      @author_2 = Author.create!(name: 'Brandon Sanderson', alive: true, age: 45)
      @author_3 = Author.create!(name: 'Brent Weeks', alive: true, age: 44)
    end

    it 'displays the list of authors' do
      visit "/authors"

      # this next command is the keywords for launchy to see the page that we are on
      # save_and_open_page
      expect(page).to have_content(@author.name)
    end

    it 'displays the most recently created author first' do
      visit "/authors"

      expect(@author_3.name).to appear_before(@author_2.name)
      expect(@author_2.name).to appear_before(@author.name)
    end

    it 'has the timestamp for when each author was created' do
      visit "/authors"

      expect(page).to have_content(@author.created_at)
      expect(page).to have_content(@author_2.created_at)
      expect(page).to have_content(@author_3.created_at)
    end

    it 'has a link to the authors index' do
      visit "/authors"

      click_on "Authors"

      expect(current_path).to eq("/authors")
    end

    it 'has a link to the books index' do
      visit "/authors"

      click_on "Books"

      expect(current_path).to eq("/books")
    end
  end
end
