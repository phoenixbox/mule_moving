require 'rails_helper'

describe HealthCheckController do
  describe 'GET #show' do
    it 'assigns the health of yelp' do
      allow_any_instance_of(YelpFinder).to receive(:find_business).with('yelp-san-francisco').and_return(double('business'))

      get :show

      expect(assigns(:yelp)).to eq true
    end
  end
end