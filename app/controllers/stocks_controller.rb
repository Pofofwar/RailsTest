# frozen_string_literal: true

class StocksController < ApplicationController
  before_action :authorize

  def index
    @stock = Stock.joins(:user).all
  end

  def show
    @stock = Stock.joins(:user).find(params[:id])
    @array = (0..@stock.duration_in_years).map do |year|
      @stock.unit_price * ((1 + (@stock.interest / 100))**year).round(3)
    end
  end

  def new
    @stock = Stock.new
  end

  def edit
    @stock = Stock.find(params[:id])
  end

  def create
    @stock = Stock.new(stock_params)

    if @stock.save
      flash[:notice] = 'Stock created successfully!'
      redirect_to stocks_path
    else
      flash.now.alert = 'There are some mistakes, please check the fields'
      render :new
    end
  end

  def update
    @stock = Stock.find(params[:id])

    if @stock.update(stock_params)
      redirect_to stocks_path
    else
      render 'edit'
    end
  end

  def destroy
    @stock = Stock.find(params[:id])
    @stock.destroy

    redirect_back fallback_location: root_path
  end

  private

  def stock_params
    result = params.require(:stock).permit(:name, :unit_price, :interest, :duration_in_years, :edit_stock_path, :user_id)
    result[:user_id] = current_user.id
    result
  end
end
