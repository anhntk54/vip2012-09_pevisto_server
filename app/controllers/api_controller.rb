class ApiController < ApplicationController
  def allproduct
  	  @products = Product.where(:user_id => params[:id])
    respond_to do |format|
      if @products.count == 0 
      #  binding.pry
        @into = {status: 0 }.to_json
          format.html # index.html.erb
          format.json { render json: @into }
        else
          format.html # index.html.erb
          format.json { render json: @products }
        end
    end  	
  end

  def showcompany
    @users = User.where( :admin => true)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def createorder
    order = Order.find(params[:id])
    respond_to do |format|
      if order.status == true
        into = {status:0 ,info: "order da thanh toan roi"}
        format.json{render json: into}
      else
        order.status = true
        order.save
        into = {status:1 ,info: "thanh toan thanh cong"}
        format.json{render json: into}
      end
    end
  end

end
