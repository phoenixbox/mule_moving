class MoversController < ApplicationController
  def index
    session[:from] = params[:from] if params[:from]
    session[:to] = params[:to] if params[:to]

    @from = session[:from]
    @to = session[:to]
    @mover_list_items = MoverListFinder.new.for_location(@from)
  end

  def show
    @mover = MoverFinder.new.find_by_id(params[:id])
  end

  private

end