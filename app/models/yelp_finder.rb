class YelpFinder
  def initialize(client = Yelp.client)
    @client = client
  end

  def find_business(business_id)
    business = @client.business(business_id)

    build_business(business)
  rescue JSON::ParserError => _
    nil
  end

  private

  def build_business(business)
    YelpBusiness.new.tap do |yelp_business|
      yelp_business.rating = business.rating
      yelp_business.review_count = business.review_count
      yelp_business.url = business.url
      yelp_business.mobile_url = business.mobile_url
      yelp_business.rating_img_url = business.rating_img_url
      yelp_business.rating_img_url_small = business.rating_img_url_small
      yelp_business.snippet_text = business.snippet_text
    end
  end
end