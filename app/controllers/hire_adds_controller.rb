class HireAddsController < ApplicationController
  def create
    @hire_add = HireAdd.new(hire_adds_params)
    @hire = Hire.find(params[:hire_id])
    @hile_add.hire = @hire
  end

  private

  def hire_adds_params
    params.require(:hire_add).permit(:hire_id, :add_id)
  end
end
