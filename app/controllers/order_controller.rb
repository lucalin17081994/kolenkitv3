class OrderController < ApplicationController
  before_action :set_product_sauce, only: [:show, :edit, :update, :destroy]
  before_action :load_cart, if:@cart
  def index
    
    @sauces=Sauce.all
    @products=Product.all
    @product_sauces = ProductSauce.all
  end
  
  def add_to_cart
    @cart||=Cart.create
    if @cart.bestelling
      @cart=Cart.create
    end
    session[:cart_id]=@cart.id
    if check_in_cart(@cart, product_sauce_params)
      p_in_cart=get_from_cart(@cart, product_sauce_params)
      p_id= product_sauce_params[:product_id].to_i
      s_id=product_sauce_params[:sauce_id].to_i
      q_bestelling=product_sauce_params[:quantity].to_i
      q_in_cart=p_in_cart.quantity
      q=q_bestelling+q_in_cart

      @cart.product_sauces.delete(p_in_cart)
      p_in_db= ProductSauce.find_by(product_id:p_id, sauce_id:s_id, quantity:q)
      if p_in_db
        p=p_in_db
      else
        p=ProductSauce.create(product_id:p_id, sauce_id:s_id, quantity:q)
      end
    
    else
      p_in_db= ProductSauce.find_by(product_sauce_params)
      if p_in_db
        p=p_in_db
      else
        p=ProductSauce.create(product_sauce_params)
      end
    end
    @cart.product_sauces<<p
    redirect_to root_path
  end

  def diminish
    p_in_cart=get_from_cart(@cart, product_sauce_params)
    p_id= product_sauce_params[:product_id].to_i
    s_id=product_sauce_params[:sauce_id].to_i
    q_in_cart=p_in_cart.quantity
    q=q_in_cart-1
    if q>0
      @cart.product_sauces.delete(p_in_cart)
      p_in_db= ProductSauce.find_by(product_id:p_id, sauce_id:s_id, quantity:q)
      if p_in_db
        p=p_in_db
      else
        p=ProductSauce.create(product_id:p_id, sauce_id:s_id, quantity:q)
        
      end
      @cart.product_sauces<<p
    else
      @cart.product_sauces.delete(p_in_cart)
    end
    redirect_to root_path

  end

  def delete_from_cart
    
    id=params[:product_sauce][:id].to_i
    a=@cart.product_sauces.to_a
    b=ProductSauce.find(id)
    @cart.product_sauces=a-[b]
    redirect_to root_path
  end

  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_product_sauce
    @product_sauce = ProductSauce.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def product_sauce_params
    params.require(:product_sauce).permit(:product_id, :sauce_id, :quantity)
  end
  def ps_params_no_quantity
    params.require(:product_sauce).permit(:product_id, :sauce_id)

  end

  def check_in_cart(cart, params)
    for p in cart.product_sauces
      if p.product_id==params[:product_id].to_i && p.sauce_id==params[:sauce_id].to_i
        return true
      end
    end
    return false
  end
  def get_from_cart(cart, params)
    for p in cart.product_sauces
      if p.product_id==params[:product_id].to_i && p.sauce_id==params[:sauce_id].to_i
        return p
      end
    end
  end
  def load_cart
    
    if session[:cart_id]
      @cart=Cart.find(session[:cart_id])
      if @cart.bestelling
        @cart=Cart.create
      end
    end
  end
  
end
