class MoversController < ApplicationController
  def index
    session[:from] = params[:from] if params[:from]
    session[:to] = params[:to] if params[:to]

    @from = session[:from]
    @to = session[:to]
    @movers = Mover.all
  end

  def show
    @mover = Mover.find(params[:id])
  end
end