class HealthCheckController < ApplicationController
  def show
    @yelp = !!YelpFinder.new.find_business('yelp-san-francisco')
  end
end