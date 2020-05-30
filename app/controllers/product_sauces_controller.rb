class ProductSaucesController < ApplicationController
  before_action :set_product_sauce, only: [:show, :edit, :update, :destroy]
  before_action :require_admin
  # GET /product_sauces
  # GET /product_sauces.json
  def index
    
    @product_sauces = ProductSauce.all
  end

  # GET /product_sauces/1
  # GET /product_sauces/1.json
  def show
  end

  # GET /product_sauces/new
  def new
    @products=Product.all
    @sauces=Sauce.all
    @broodjes=Brood.all
    @product_sauce = ProductSauce.new
  end

  # GET /product_sauces/1/edit
  def edit
    @products=Product.all
    @sauces=Sauce.all
    
  end

  # POST /product_sauces
  # POST /product_sauces.json
  def create
    @product_sauce = ProductSauce.new(product_sauce_params)

    respond_to do |format|
      if @product_sauce.save
        format.html { redirect_to @product_sauce, notice: 'Product sauce was successfully created.' }
        format.json { render :show, status: :created, location: @product_sauce }
      else
        format.html { render :new }
        format.json { render json: @product_sauce.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_sauces/1
  # PATCH/PUT /product_sauces/1.json
  def update
    respond_to do |format|
      if @product_sauce.update(product_sauce_params)
        format.html { redirect_to root_path, notice: 'Product sauce was successfully updated.' }
        format.json { render :show, status: :ok, location: @product_sauce }
      else
        format.html { render :edit }
        format.json { render json: @product_sauce.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_sauces/1
  # DELETE /product_sauces/1.json
  def destroy
    @product_sauce.destroy
    respond_to do |format|
      format.html { redirect_to product_sauces_url, notice: 'Product sauce was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_sauce
      @product_sauce = ProductSauce.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_sauce_params
      params.require(:product_sauce).permit(:product_id, :brood_id, :sauce_id, :quantity, :flavor )
    end

    
end
