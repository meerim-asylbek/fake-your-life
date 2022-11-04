class HireAddsController < ApplicationController
  before_action :set_hire_add, only: %i[destroy]
  before_action :set_hire, only: %i[new, create]

  def new
    @hire_add = HireAdd.new
  end

  def create
    @hire_add = HireAdd.new(hire_add_params)
    @hire_add.hire = @hire
    if @hire_add.save
      redirect_to hire_path(@hire)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @hire_add.destroy
    redirect_to hire_path(@hire_add.hire), status: :see_other
  end

  private
  
  def set_hire_add
    @hire_add = HireAdd.find(params[:id])
  end

  def set_hire
    @hire = Hire.find(params[:hire_id])
  end

  def hire_add_params
    params.require(:hire_add).permit(:hire_id, :add_id)
  end
end
