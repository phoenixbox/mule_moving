class MoversController < ApplicationController
  def index
    session[:from] = params[:from] if params[:from]
    session[:to] = params[:to] if params[:to]

    @from = session[:from]
    @to = session[:to]
    @movers = mover_finder.all
  end

  def show
    @mover = mover_finder.find_by_id(params[:id])
  end

  private

  def mover_finder
    MoverFinder.new
  end
end