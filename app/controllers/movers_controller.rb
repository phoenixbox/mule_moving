class MoversController < ApplicationController
  def index
    session[:from] = params[:from] if params[:from]
    session[:to] = params[:to] if params[:to]

    @from = session[:from]
    @to = session[:to]
    @mover_list_items = MoverListFinder.new.for_location(@from)
  end

  def show
    @mover_detail = MoverDetailFinder.new.for_id(params[:id])
  end
end