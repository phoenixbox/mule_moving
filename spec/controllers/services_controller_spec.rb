require "rails_helper"

describe ServicesController do
  describe "GET #details" do
    it "assigns service and services" do
      get :details, service: :packaging

      expect(assigns(:service)).to eq "packaging"
      expect(assigns(:services)).to eq MoverServicesRecord::SERVICES
    end
  end
end