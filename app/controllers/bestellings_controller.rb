class BestellingsController < ApplicationController
  before_action :set_bestelling, only: [:show, :edit, :update, :destroy]
  before_action :load_cart, only: [:new]
  before_action :require_admin, only:[:edit, :update, :destroy, :index]
  # GET /bestellings
  # GET /bestellings.json
  def index
    @bestellings = Bestelling.all
  end

  # GET /bestellings/1
  # GET /bestellings/1.json
  def show
    
    @bestelling=Bestelling.find(params[:id])
  end

  # GET /bestellings/new
  def new
    if @cart.product_sauces.size<1
      flash[:notice]="winkelmandje kan niet leeg zijn"
      redirect_to root_path
    end
    @bestelling = Bestelling.new
  end

  # GET /bestellings/1/edit
  def edit
  end

  # POST /bestellings
  # POST /bestellings.json
  def create
    id=params[:bestelling][:cart_id]
    @cart=Cart.find(id)
    @bestelling = Bestelling.new(bestelling_params)

    respond_to do |format|
      if @bestelling.save
        @cart.user=current_user
        @cart.save
        session[:cart_id]=nil
        format.html { redirect_to root_path, notice: 'Bestelling was successfully created.' }
        format.json { render :show, status: :created, location: @bestelling }
      else
        format.html { render :new }
        format.json { render json: @bestelling.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bestellings/1
  # PATCH/PUT /bestellings/1.json
  def update
    respond_to do |format|
      if @bestelling.update(bestelling_params)
        format.html { redirect_to @bestelling, notice: 'Bestelling was successfully updated.' }
        format.json { render :show, status: :ok, location: @bestelling }
      else
        format.html { render :edit }
        format.json { render json: @bestelling.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bestellings/1
  # DELETE /bestellings/1.json
  def destroy
    @bestelling.destroy
    respond_to do |format|
      format.html { redirect_to bestellings_url, notice: 'Bestelling was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bestelling
      @bestelling = Bestelling.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bestelling_params
      params.require(:bestelling).permit(:cart_id, :address, :number)
    end
    def load_cart
      id=params[:cart_id]
      @cart=Cart.find(id)
    end
    
end
