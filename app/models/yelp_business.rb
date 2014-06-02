class YelpBusiness
  attr_accessor :review_count,
                :review_snippet,
                :url,
                :stars_img_url,
                :stars_img_url_small

  attr_writer :stars

  def stars
    if @stars == 5.0
      5
    else
      @stars
    end
  end
end