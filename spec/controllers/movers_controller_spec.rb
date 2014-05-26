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
      allow_any_instance_of(MoverFinder).to receive(:all).and_return(all_movers)

      get :index

      expect(assigns(:movers)).to eq all_movers
    end
  end

  describe 'GET #show' do
    it 'assigns mover' do
      mover = double('mover')
      allow_any_instance_of(MoverFinder).to receive(:find_by_id).with('4').and_return(mover)

      get :show, id: 4

      expect(assigns(:mover)).to eq mover
    end
  end
end