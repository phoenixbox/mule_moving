require "rails_helper"

describe ServicesController do
  describe "GET #details" do
    it "assigns service and services" do
      get :details, service: :packaging

      expect(assigns(:service)).to eq "packaging"
      expect(assigns(:services)).to eq MoverServicesRecord::SERVICE_LIST
    end

    it "returns a 404 if service is not recognized" do
      get :details, service: :nonexistant

      expect(response.status).to eq 404
    end
  end
end