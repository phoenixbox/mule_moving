require 'spec_helper'

describe 'Movers', type: :feature do
  it 'lists all movers' do
    taylor_moving = create_mover name: 'Taylor Moving', description: 'Taylor Moving Description'
    MoverYelpRecord.create(mover_id: taylor_moving.id, yelp_id: 'taylors')
    yelp_business = YelpBusiness.new
    yelp_business.rating = 2.5

    MoverPricingRecord.create(mover_id: taylor_moving.id, avg_price_per_hour: 45)
    MoverComplianceRecord.create(mover_id: taylor_moving.id, general_liability_insurance: 'http://ss3.com/gen_liab_insurance_5')
    MoverStatisticsRecord.create(mover_id: taylor_moving.id, years_in_business: 10)

    allow_any_instance_of(YelpFinder).to receive(:find_business).with('taylors').and_return(yelp_business)

    create_mover name: 'Your Personal Mover'
    create_mover name: 'Mafia Movers'

    visit movers_path(from: 'Boulder', to: 'Denver')

    expect(page).to have_content 'Boulder'
    expect(page).to have_content 'Denver'

    expect(page).to have_content 'Taylor Moving'
    expect(page).to have_content 'Your Personal Mover'
    expect(page).to have_content 'Mafia Movers'

    and_it 'displays yelp information for movers' do
      expect(page).to have_content '10 Years in Business'
      expect(page).to have_content '$45 avg per hour'
      expect(page).to have_content 'Insured'
      expect(page).to have_content '2.5 Stars'
      expect(page).to have_content 'Taylor Moving Description'
    end
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