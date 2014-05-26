class YelpFinder
  def initialize(client = Yelp.client)
    @client = client
  end

  def find_business(business_id)
    @client.business(business_id)
  rescue JSON::ParserError => _
    nil
  end
end