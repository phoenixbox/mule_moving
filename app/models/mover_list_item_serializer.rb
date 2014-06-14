class MoverListItemSerializer
  def initialize(mover_list_item)
    @mover_list_item = mover_list_item
  end

  def as_json(opts = {})
    {
      id: @mover_list_item.id,
      name: @mover_list_item.name,
      description: @mover_list_item.description,
      hero_img: @mover_list_item.hero_img,
      yelp_stars: @mover_list_item.yelp_stars,
      yelp_url: @mover_list_item.yelp_url,
      yelp_review_count: @mover_list_item.yelp_review_count,
      employees: @mover_list_item.employees,
      general_liability_insurance: @mover_list_item.general_liability_insurance,
      avg_price_per_hour: @mover_list_item.avg_price_per_hour,
      years_in_business: years_in_business,
      path: path
    }
  end

  private

  def years_in_business
    return nil unless @mover_list_item.year_started

    Time.zone.now.year - @mover_list_item.year_started
  end

  def path
    Rails.application.routes.url_helpers.mover_path(@mover_list_item.id)
  end
end











