class MoversController < ApplicationController
  def index
    @to = params[:to]
    @from = params[:from]

    @movers = Mover.all
  end
end