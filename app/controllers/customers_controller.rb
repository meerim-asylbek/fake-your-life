class CustomersController < ApplicationController
  before_action :set_customer, only: %i[show create edit update]

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    @customer.user = current_user
    if @customer.save
      redirect_to customer_path(@customer)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit

  end

  def update
    @customer.update(customer_params)
    redirect_to customer_path(@customer)
  end

  private

  def set_customer
    @customer = Customer.find_by(user_id: current_user.id)
  end

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :address, :age, :avatar)
  end
end
