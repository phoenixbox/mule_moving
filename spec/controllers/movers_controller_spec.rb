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

    it 'assigns mover_list_items for location' do
      mover_list_items = [double]
      allow_any_instance_of(MoverListFinder).to receive(:for_location).with('Madagascar').and_return(mover_list_items)

      get :index, from: 'Madagascar'

      expect(assigns(:mover_list_items)).to eq mover_list_items
    end
  end

  describe 'GET #show' do
    it 'assigns mover_detail' do
      mover_detail = double('mover detail')
      allow_any_instance_of(MoverDetailFinder).to receive(:for_id).with('4').and_return(mover_detail)

      get :show, id: 4

      expect(assigns(:mover_detail)).to eq mover_detail
    end
  end
end