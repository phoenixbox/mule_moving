require "rails_helper"

describe "Booking", type: :feature, js: true do
  it "can be done on index page" do
    create_mover name: "Mafioso Movers"

    visit movers_path(from: "Boulder", to: "Denver")

    first("a", text: "Book").click

    expect(page).to have_field :booking_from, with: "Boulder"
    expect(page).to have_field :booking_to, with: "Denver"

    page.execute_script "$('td.day:contains(12)').click()"

    fill_in :booking_email, with: "me@example.com"

    click_on "Book"

    expect(page).to have_content "Success"
  end
end