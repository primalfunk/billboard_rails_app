class ChartsController < ApplicationController
  before_action :set_chart, only: [:show, :update, :edit, :destroy]

  def index
    @charts = Chart.all
  end

  def show
  end

  def new
    @chart = Chart.new
  end
  
  def edit
  end

  def create
    @chart = Chart.new(chart_params)
    
    if @chart.save
      redirect_to charts_path
    else
      render :new
    end
  end

  def update
    if @chart.update(charts_params)
      redirect_to @chart
    else
      render :edit
    end
  end

  def destroy
    @chart.destroy
    redirect_to charts_path
  end

  private
    
    def set_chart
      @chart = Chart.find(params[:id])
    end

    def chart_params
      params.require(:chart).permit(:title)
    end
end