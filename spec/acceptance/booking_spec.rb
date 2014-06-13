require 'rails_helper'

describe 'Booking', type: :feature, js: true do
  xit 'can be done on index page' do
    create_mover name: 'Mafioso Movers'

    visit movers_path(from: 'Boulder', to: 'Denver')

    first('a', text: 'Book').click

    within '.modal' do
      click_on '14'
      fill_in :email, with: 'me@example.com'

      click_on 'Book'
    end

    expect(page).to have_content 'Success'
  end
end