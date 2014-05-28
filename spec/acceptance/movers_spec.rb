require 'spec_helper'

describe 'Movers', type: :feature do
  it 'lists all movers' do
    create_mover name: 'Taylor Moving'
    create_mover name: 'Your Personal Mover'
    create_mover name: 'Mafia Movers'

    visit movers_path(from: 'Boulder', to: 'Denver')

    expect(page).to have_content 'Boulder'
    expect(page).to have_content 'Denver'

    expect(page).to have_content 'Taylor Moving'
    expect(page).to have_content 'Your Personal Mover'
    expect(page).to have_content 'Mafia Movers'
  end

  it 'viewing a mover' do
    create_mover name: 'Mafia Movers', description: 'You\'re under our protection now'

    visit movers_path(from: 'Boulder', to: 'Denver')

    click_on 'Mafia Movers'

    expect(page).to have_content 'Mafia Movers'
    expect(page).to have_content 'You\'re under our protection now'

    click_on 'Back'

    expect(page).to have_content 'Mafia Movers'
    expect(page).to have_content 'Boulder'
    expect(page).to have_content 'Denver'
  end
end