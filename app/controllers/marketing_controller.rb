class MarketingController < ApplicationController
  def services
    @service = params[:service]
    @services = MoverServicesRecord::SERVICES
  end

  def mule_process
    @process = params[:process] || "problem"
  end
end