class HiresController < ApplicationController

  def new

  end

  def create

  end

  private

  def hire_params
    params.require(:hire).permit(:start_date, :end_date, :total_price, :artist)
  end
end
