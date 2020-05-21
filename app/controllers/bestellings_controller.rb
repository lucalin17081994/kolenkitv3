class BestellingsController < ApplicationController
  before_action :set_bestelling, only: [:show, :edit, :update, :destroy]
  before_action :load_cart, only: [:new]
  before_action :require_admin, only:[:edit, :update, :destroy, :index]
  before_action :fix_params, :only => [:create]
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
    if current_user
      @bestelling.user=current_user
    end
    respond_to do |format|
      
      if @bestelling.save
        session[:cart_id]=nil

        if @bestelling.isBezorgd
          format.html { redirect_to @bestelling, notice: 'Hartelijk dank voor uw bestelling.' }
          format.json { render :show, status: :created, location: @bestelling }
        else
          format.html { redirect_to @bestelling, notice: 'Hartelijk dank voor uw bestelling.' }
          format.json { render :show, status: :created, location: @bestelling }
        end
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
        format.html { redirect_to bestellings_path, notice: 'Bestelling was successfully updated.' }
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
  def get_current_user
    respond_to do |format|
       format.json{ render :json => current_user.to_json }
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bestelling
      @bestelling = Bestelling.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bestelling_params
      params.require(:bestelling).permit(:cart_id, :address, :number, :isBezorgd,:done,:time,:note)
    end
    def load_cart
      id=params[:cart_id]
      @cart=Cart.find(id)
    end

    def fix_params
        time = Time.zone.parse((params[:bestelling][:time_hour])+":"+params[:bestelling][:time_minute])
        params[:bestelling][:time]=time
    end
    
end
