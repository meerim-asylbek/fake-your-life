class CustomersController < ApplicationController
  before_action :set_customer, only: [:show]
  before_action :set_user, only: [:new, :show, :create]

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    @customer.user = @user
    if @customer.save
      redirect_to user_customer_path(@customer.user, @customer)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  private

  def set_user
    @user = current_user
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :address, :age, :avatar)
  end
end
