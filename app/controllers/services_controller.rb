class ServicesController < ApplicationController
  before_action :bail_if_service_not_known

  def details
    @service = params[:service]
    @services = MoverServicesRecord::SERVICE_LIST
  end

  private

  def bail_if_service_not_known
    unless MoverServicesRecord::SERVICE_LIST.include? params[:service].to_sym
      render status: :not_found
    end
  end
end