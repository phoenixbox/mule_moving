class MoversController < ApplicationController
  def index
    session[:from] = params[:from] if params[:from]
    session[:to] = params[:to] if params[:to]

    @from = session[:from]
    @to = session[:to]
    items = MoverListFinder.new.for_location(@from)
    @mover_list_items = items.map { |item| MoverListItemSerializer.new(item).as_json }
  end

  def show
    @from = session[:from]
    @to = session[:to]

    @mover_detail = MoverDetailFinder.new.for_id(params[:id])
  end
end