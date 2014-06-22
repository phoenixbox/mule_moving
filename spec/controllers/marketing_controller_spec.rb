require "rails_helper"

describe MarketingController do
  describe "GET #services" do
    it "assigns service and services" do
      get :services, service: :packaging

      expect(assigns(:service)).to eq "packaging"
      expect(assigns(:services)).to eq MoverServicesRecord::SERVICES
    end
  end

  describe "GET #mule_process" do
    it "assigns process" do
      get :mule_process, process: :solution

      expect(assigns(:process)).to eq "solution"
    end
  end
end