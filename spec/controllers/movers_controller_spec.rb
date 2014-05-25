require 'spec_helper'

describe MoversController do
  describe 'GET #index' do
    it 'assigns from/to and stores in session' do
      get :index, from: 'Boulder', to: 'Denver'

      expect(assigns(:from)).to eq 'Boulder'
      expect(assigns(:to)).to eq 'Denver'

      expect(session[:from]).to eq 'Boulder'
      expect(session[:to]).to eq 'Denver'
    end

    it 'assigns from/to as session values if none given' do
      session[:from] = 'Monkey Island'
      session[:to] = 'Madagascar'

      get :index

      expect(assigns(:from)).to eq 'Monkey Island'
      expect(assigns(:to)).to eq 'Madagascar'
    end

    it 'assigns all movers' do
      all_movers = [double]
      allow(Mover).to receive(:all).and_return(all_movers)

      get :index

      expect(assigns(:movers)).to eq all_movers
    end
  end
end