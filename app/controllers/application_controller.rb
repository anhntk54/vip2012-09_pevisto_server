class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  def signed_in_user
      if !signed_in? 
      	redirect_to signin_path, notice: "Please sign in."
      elsif !current_user.admin?
      		redirect_to(home_path)
      end
    end
  def checkInventory (order)
  	if order.quantily > order.product.inventory
  		return false
  	else
  		return true
  	end
  end
end
