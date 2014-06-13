require 'rails_helper'

describe 'Home', type: :feature do
  it 'views homepage and navigates to the movers index' do
    visit root_path

    expect(page).to have_content 'Find your perfect mover'
    expect(page).to have_link 'Contact Us', href: 'mailto:team@mulemoving.com?Subject=Mule%20Moving'

    expect(page).to have_field :from, with: 'Boulder'
    expect(page).to have_field :to
    expect(page).to have_button 'Discover'

    fill_in :to, with: 'Denver'

    click_button 'Discover'

    expect(page).to have_content 'Boulder'
    expect(page).to have_content 'Denver'
  end
end