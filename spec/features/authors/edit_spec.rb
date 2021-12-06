require 'rails_helper'

RSpec.describe 'edit an author' do
  describe 'from the show page' do
    before :each do
      @author = Author.create!(name: 'Robert Jordan', alive: true, age: 58)
      @author_2 = Author.create!(name: 'Will Wight', alive: true, age: 43)
      @author_3 = Author.create!(name: 'Robert Frost', alive: false, age: 67)
    end

    it 'links to the edit author page' do
      visit "/authors/#{@author.id}"

      click_link "Update Author"

      expect(current_path).to eq("/authors/#{@author.id}/edit")
    end

    it 'can edit the author' do
      visit "authors/#{@author.id}/edit"

      fill_in('Name', with: 'Robert Jordan')
      fill_in('Age', with: 58)
      uncheck('Alive')
      click_button 'Update Author'

      expect(current_path).to eq("/authors/#{@author.id}")
      expect(page).to have_content("Robert Jordan")
      expect(page).to have_content("Age: 58")
      expect(page).to have_content("Living: false")
    end

    describe 'from the index page' do
      it 'links to the edit author page' do
        visit "/authors"

        click_on "Update: #{@author_2.name}"

        expect(current_path).to eq("/authors/#{@author_2.id}/edit")
      end
    end
  end
end
