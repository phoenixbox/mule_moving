require "rails_helper"

describe "Movers", type: :feature, pending: true do
  it "lists all movers" do
    taylor_moving = create_mover name: "Taylor Moving", description: "Taylor Moving Description"
    create_mover_yelp mover_id: taylor_moving.id, yelp_id: "taylors"
    create_mover_pricing(mover_id: taylor_moving.id, avg_price_per_hour: 45)
    create_mover_compliance(mover_id: taylor_moving.id, general_liability_insurance: true)
    create_mover_statistics(mover_id: taylor_moving.id, year_started: (Time.now.year - 10))

    allow_any_instance_of(YelpFinder).to receive(:find_business).with("taylors").and_return(new_yelp_business stars: 2.5)

    create_mover name: "Mafia Movers"

    visit movers_path(from: "Boulder", to: "Denver")

    expect(page).to have_content "Boulder"
    expect(page).to have_content "Denver"

    expect(page).to have_content "Taylor Moving"
    expect(page).to have_content "Mafia Movers"

    within "li", text: "Taylor Moving" do
      expect(page).to have_content "10 Years"
      expect(page).to have_content "$45 avg per hour"
      expect(page).to have_content "Insured"
      rating = first(".rating")["data-rating"]
      expect(rating).to eq "2.5"
      expect(page).to have_content "Taylor Moving Description"
    end
  end

  it "viewing a mover" do
    mover = create_mover name: "Mafia Movers", description: "You're under our protection now"
    create_mover_statistics(mover_id: mover.id, year_started: (Time.now.year - 2), employees: 10, trucks: 2)
    create_mover_pricing(mover_id: mover.id, avg_price_per_hour: 46)
    create_mover_address(mover_id: mover.id, line1: "123 Circle Road", city: "Boulder", state: "CO", zip: "80301")
    create_mover_yelp(mover_id: mover.id, yelp_id: "mafioso")
    create_mover_compliance(mover_id: mover.id, automobile_insurance: true, cargo_insurance: true)
    create_mover_licenses(mover_id: mover.id, company_registration: "Z123", puc: "A123", state_dot: "B123", us_dot: "C123")
    create_mover_opening_hour(mover_id: mover.id, day_of_week: 1, open: Time.zone.parse("8:00"), close: Time.zone.parse("10:00"))
    create_mover_opening_hour(mover_id: mover.id, day_of_week: 7, open: Time.zone.parse("8:00"), close: Time.zone.parse("20:00"))
    create_mover_services(mover_id: mover.id, appliances_install: true, storage: true)

    allow_any_instance_of(YelpFinder).to receive(:find_business).with("mafioso").and_return(new_yelp_business stars: 4.5, review_count: 12, review_snippet: "These guys took great care of our furniture!")

    visit movers_path(from: "Boulder", to: "Denver")

    within "li.row", text: "Mafia Movers" do
      click_link "View"
    end

    expect(page).to have_content "Mafia Movers"
    expect(page).to have_content "You're under our protection now"
    expect(page).to have_content "2 Years"
    expect(page).to have_content "123 Circle Road, Boulder, CO, 80301"
    expect(page).to have_content "$46 avg per hour"
    expect(page).to have_css(".rating")
    expect(page).to have_content "Company Registration: Z123"
    expect(page).to have_content "PUC: A123"
    expect(page).to have_content "State Dot: B123"
    expect(page).to have_content "US Dot: C123"
    expect(page).to have_content "Employees: 10"
    expect(page).to have_content "Trucks: 2"

    expect(page).to have_button "Book"
  end
end
