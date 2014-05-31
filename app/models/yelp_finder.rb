class YelpFinder
  def initialize(client = Yelp.client)
    @client = client
  end

  def find_business(business_id)
    remote_business = @client.business(business_id)

    build_business(remote_business)
  rescue JSON::ParserError => _
    nil
  end

  private

  def build_business(remote_business)
    YelpBusiness.new.tap do |local_business|
      local_business.stars = remote_business.rating
      local_business.review_count = remote_business.review_count
      local_business.review_snippet = remote_business.snippet_text
      local_business.url = remote_business.url
      local_business.stars_img_url = remote_business.rating_img_url
      local_business.stars_img_url_small = remote_business.rating_img_url_small
    end
  end
end