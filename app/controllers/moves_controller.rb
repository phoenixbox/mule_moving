class MovesController < ApplicationController
  def create
    # create some shiz
    redirect_to movers_path(to: params[:to], from: params[:from])
  end
end