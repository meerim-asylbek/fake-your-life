class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(resources)
    if Customer.find_by(user_id: resources.id).nil?
      new_customer_path
    else
      artists_path
    end
  end

end
