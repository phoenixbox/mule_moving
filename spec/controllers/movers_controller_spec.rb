require "rails_helper"

describe MoversController do
  describe "GET #index" do
    it "assigns from/to and stores in session" do
      get :index, from: "Boulder", to: "Denver"

      expect(assigns(:from)).to eq "Boulder"
      expect(assigns(:to)).to eq "Denver"

      expect(session[:from]).to eq "Boulder"
      expect(session[:to]).to eq "Denver"
    end

    it "assigns from/to as session values if none given" do
      session[:from] = "Monkey Island"
      session[:to] = "Madagascar"

      get :index

      expect(assigns(:from)).to eq "Monkey Island"
      expect(assigns(:to)).to eq "Madagascar"
    end

    it "assigns mover_list_items for location" do
      mover_list_item = MoverListItem.new
      serializer = double
      serialized_item = double
      allow_any_instance_of(MoverListFinder).to receive(:for_location).with("Madagascar").and_return([mover_list_item])
      allow(MoverListItemSerializer).to receive(:new).with(mover_list_item).and_return(serializer)
      allow(serializer).to receive(:as_json).and_return(serialized_item)

      get :index, from: "Madagascar"

      expect(assigns(:mover_list_items)).to eq [serialized_item]
    end

    it "assigns services" do
      get :index

      expect(assigns(:services)).to eq MoverServicesRecord::SERVICES
    end
  end

  describe "GET #show" do
    it "assigns mover_detail" do
      mover_detail = double("mover detail")
      expect_any_instance_of(MoverDetailFinder).to receive(:for_id).with("4").and_return(mover_detail)

      get :show, id: 4

      expect(assigns(:mover_detail)).to eq mover_detail
    end

    it "assigns from/to as session values if none given" do
      session[:from] = "Monkey Island"
      session[:to] = "Madagascar"

      allow_any_instance_of(MoverDetailFinder).to receive(:for_id).with("4")

      get :show, id: 4

      expect(assigns(:from)).to eq "Monkey Island"
      expect(assigns(:to)).to eq "Madagascar"
    end
  end
end