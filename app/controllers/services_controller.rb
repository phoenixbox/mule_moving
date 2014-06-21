class ServicesController < ApplicationController
  def details
    @service = params[:service]
    @services = MoverServicesRecord::SERVICES
  end
end