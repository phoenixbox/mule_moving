require "rails_helper"

describe "Booking", type: :feature do
  it "can be done on index page", js: true do
    create_mover name: "Mafioso Movers"

    visit movers_path(from: "Boulder", to: "Denver")

    first("a", text: "Book").click

    expect(page).to have_field :booking_from, with: "Boulder"
    expect(page).to have_field :booking_to, with: "Denver"

    fill_in :booking_move_date, with: "06/26/2014"
    fill_in :booking_email, with: "me@example.com"

    click_on "Book"

    expect(page).to have_content "Success"
  end

  it "can be done on the details page" do
    mafioso = create_mover name: "Mafioso Movers"

    visit mover_path(mafioso.id)

    click_on "Book"

    fill_in :booking_from, with: "Boulder"
    fill_in :booking_to, with: "Denver"
    fill_in :booking_move_date, with: "06/26/2014"
    fill_in :booking_email, with: "me@example.com"

    click_on "Book"

    expect(page).to have_content "Success"
  end
end