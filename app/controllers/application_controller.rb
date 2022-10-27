class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(resources)
    artists_path || root_path
  end

#TODO after customer controller
  #def after_sign_up_path_for(resources)
    #new_customer(resources)
  #end

end
