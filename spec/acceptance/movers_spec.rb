require 'spec_helper'

describe 'Movers', type: :feature do
  it 'lists all movers' do
    create_mover name: 'Taylor Moving'
    create_mover name: 'Your Personal Mover'
    create_mover name: 'Mafia Movers'

    visit movers_path

    expect(page).to have_content 'Taylor Moving'
    expect(page).to have_content 'Your Personal Mover'
    expect(page).to have_content 'Mafia Movers'
  end
end