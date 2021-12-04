require 'rails_helper'

RSpec.describe 'create new author' do
  it 'links to new page from author index' do
    visit "/authors"

    click_link "New Author"

    expect(current_path).to eq('/authors/new')
  end

  it 'can create a new artist' do
    visit "/authors/new"

    fill_in('Name', with: 'Tracy Hickman')
    fill_in('Age', with: 66)
    check('Alive')

    click_button "Create Author"

    expect(current_path).to eq("/authors")
    expect(page).to have_content("Tracy Hickman")
  end
end
