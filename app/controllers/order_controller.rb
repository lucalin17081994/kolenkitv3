class OrderController < ApplicationController
  before_action :set_product_sauce, only: [:show, :edit, :update, :destroy]
  before_action :set_categories, only: [:index]
  before_action :load_cart
  def index
    #@cart=Cart.create
    @sauces=Sauce.all
    @products=Product.all
    @product_sauces = ProductSauce.all
    @broodjes=Brood.all
    if @cart
      if @cart.bestelling
        @cart=make_cart
      end
    else
      @cart= make_cart
    end
  end
  
  def add_to_cart
    
    if check_in_cart(@cart, product_sauce_params) #if in cart
      p_in_cart=get_from_cart(@cart, product_sauce_params)
      
      p_id= product_sauce_params[:product_id].to_i
      s_id=product_sauce_params[:sauce_id].to_i
      f=product_sauce_params[:flavor]
      q_bestelling=product_sauce_params[:quantity].to_i
      q_in_cart=p_in_cart.quantity
      q=q_bestelling+q_in_cart
      b_id=product_sauce_params[:brood_id].to_i

      
      #@cart.product_sauces.delete(ProductSauce.find(p_in_cart.id))
      @cart.product_sauces=remove_from_cart(@cart,p_in_cart)
      p=set_or_create_product(p_id,s_id,q,f,b_id)
      @cart.product_sauces<<p
    else #if not in cart
      p_in_db= ProductSauce.find_by(product_sauce_params)
      if p_in_db
        p=p_in_db
        @cart.product_sauces<<p
      else
        p=ProductSauce.create(product_sauce_params)
        @cart.product_sauces<<p
      end
    end
    respond_to do |format|

      format.js {render 'update_cart'}
    end
  end

  def diminish
    p_in_cart=get_from_cart(@cart, product_sauce_params)
    p_id= product_sauce_params[:product_id].to_i
    s_id=product_sauce_params[:sauce_id].to_i
    f=product_sauce_params[:flavor]
    b_id=product_sauce_params[:brood_id].to_i
    q_in_cart=p_in_cart.quantity
    q=q_in_cart-1
    if q_in_cart>1
      @cart.product_sauces=remove_from_cart(@cart,p_in_cart)
      p=set_or_create_product(p_id, s_id, q, f, b_id)
      @cart.product_sauces<<p
    else
      @cart.product_sauces=remove_from_cart(@cart,p_in_cart)

    end
    
    respond_to do |format|

      format.js {render 'update_cart'}
    end

  end

  def delete_from_cart
    
    id=params[:product_sauce][:id].to_i
    
    @cart.product_sauces=@cart.product_sauces.reject{ |p| p.id==id }

    respond_to do |format|

      format.js {render 'update_cart'}
    end
  end

  
  private
  # Use callbacks to share common setup or constraints between actions.

  def remove_from_cart(cart,p_in_cart)
    cart.product_sauces.reject{ |p| p.product_id==p_in_cart.product_id && 
                                    p.sauce_id==p_in_cart.sauce_id && 
                                    p.flavor==p_in_cart.flavor && 
                                    p.brood_id==p_in_cart.brood_id}
  end
  def set_product_sauce
    @product_sauce = ProductSauce.find(params[:id])
  end
  def set_categories
    @categories = Category.all
  end

  # Only allow a list of trusted parameters through.
  def product_sauce_params
    params.require(:product_sauce).permit(:product_id, :sauce_id, :quantity, :flavor,:brood_id)
  end
  def ps_params_no_quantity
    params.require(:product_sauce).permit(:product_id, :sauce_id,:flavor,:brood_id)

  end

  def check_in_cart(cart, params)
    for p in cart.product_sauces
      if p.product_id==params[:product_id].to_i && 
        p.sauce_id==params[:sauce_id].to_i && 
        p.flavor==params[:flavor] && 
        p.brood_id==params[:brood_id].to_i
        return true
      end
    end
    return false
  end
  def get_from_cart(cart, params)
    for p in cart.product_sauces
      if p.product_id==params[:product_id].to_i && 
        p.sauce_id==params[:sauce_id].to_i && 
        p.flavor==params[:flavor] && 
        p.brood_id==params[:brood_id].to_i
        return p
      end
    end
  end
  def set_or_create_product(p_id, s_id, q, f, b_id)
    p_in_db= ProductSauce.find_by(product_id:p_id, sauce_id:s_id, quantity:q, flavor:f, brood_id:b_id)
    p=nil
    if p_in_db
      p=p_in_db
    else
      p=ProductSauce.create(product_id:p_id, sauce_id:s_id, quantity:q, flavor:f, brood_id:b_id)
    end
    return p

  end
  def make_cart
    cart=Cart.create
    session[:cart_id]=cart.id
    return cart
  end
  def load_cart
    if session[:cart_id]#if session exist
      if Cart.exists?(id: session[:cart_id])#if cart exist
        @cart=Cart.find(session[:cart_id])#find cart
        
        if @cart.bestelling#create new cart if order went through
          @cart=make_cart
        end
      end
    else
      #if session doesnt exist, set session to nil. carts are created on button click
      @cart=make_cart
    end
    
  end
  
end
