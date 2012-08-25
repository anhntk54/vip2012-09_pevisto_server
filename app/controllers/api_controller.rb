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


  def userorder
    user = User.find(params[:id])
    if params[:status] == "false"
            test = false
        elsif params[:status] == "true"
            test = true
        else
            test = nil
        end
    respond_to do |format|
      if test == nil
        format.json{render json: user.order}
      else
        format.json{render json: user.order.where(:status => test)}
      end
    end
  end

  def statistics_date
    user = User.find(params[:id])
    if user.admin?
       if params[:month] != nil
        binding.pry
          user.products.each do |p|
            if p.created_at.moth == params[:month].to_i
              binding.pry
            end
          end
        else
          info = {status: -1 ,info:"Not statistics_date"}  
        end
      else
        info = {status: 0 ,info:"Not user admin"}
      end

    respond_to do |format|
      format.json{render json:info}
  end
  end

end
