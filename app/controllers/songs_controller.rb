class SongsController < ApplicationController
  before_action :set_artist
  before_action: :set_chart
  
  def show
  end

  private
    def set_artist
      @artist = Artist.find(params[:id])
    end

    def set_chart
      @chart = Chart.find(params[:id])
    end
end
