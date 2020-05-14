class OrderController < ApplicationController
  before_action :set_product_sauce, only: [:show, :edit, :update, :destroy]
  before_action :load_cart
  def index
    @cart||=Cart.create
    if @cart.bestelling
      @cart=Cart.create
    end
    session[:cart_id]=@cart.id
    @sauces=Sauce.all
    @products=Product.all
    @product_sauces = ProductSauce.all
  end
  
  def add_to_cart
    if ProductSauce.find_by(product_sauce_params)
      p=ProductSauce.find_by(product_sauce_params)
    else
      p=ProductSauce.new(product_sauce_params)
    end
    @cart.product_sauces<<p
    redirect_to root_path
  end
  
  def delete_from_cart
    
    id=params[:product_sauce][:id].to_i
    @cart.product_sauces.delete(id)
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
  def load_cart
    if (session[:cart_id])
      @cart=Cart.find(session[:cart_id])
    end
  end
  
end
