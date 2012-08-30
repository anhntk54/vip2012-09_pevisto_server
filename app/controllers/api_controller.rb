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
        order.product.inventory = order.product.inventory - order.quantily
        order.product.save
        order.status = true
        order.save
        into = {status:1 ,info: "thanh toan thanh cong"}
        format.json{render json: into}
      end
    end
  end

  def addquantily
    order = Order.find(params[:id])
    order.quantily = order.quantily + params[:q].to_i
    respond_to do |format|
      if order.save
        info = {status:1,info:"add quantily sussessful  "}
        format.json{render json: info}
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
    if test == nil
      allorder = user.order
      else
        allorder = user.order.where(:status => test)
    end
    array  = Array.new
    allorder.each do |o|
      info = {id: o.id,user_id: o.user_id, product_id:o.product_id,quantily:o.quantily,
              product: o.product.product,image:o.product.image}
      array<<info
    end
    respond_to do |format|
      format.json{render json: array}
    end
  end

  def deleteorder
    order = Order.find(params[:id])
    respond_to do |format|
      if order.destroy
        info = {status: 1, info: "delete sussessful"}
        format.json{render json: info}
      end
    end
  end

    def search
    respond_to do |format|
      if params[:id].to_i == 1
        like = params[:s].concat("%")
        product = Product.find(:all, :conditions => ["product like ?", like])
        format.json{render json: product}
      else
        like = params[:s].concat("%")
        product = User.find(:all, :conditions => ["user like ?", like])
        format.json{render json: product}
      end
    end
  end
end
