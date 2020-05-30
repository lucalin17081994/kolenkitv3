class BroodsController < ApplicationController
  before_action :set_brood, only: [:show, :edit, :update, :destroy]

  # GET /broods
  # GET /broods.json
  def index
    @broods = Brood.all
  end

  # GET /broods/1
  # GET /broods/1.json
  def show
  end

  # GET /broods/new
  def new
    @brood = Brood.new
  end

  # GET /broods/1/edit
  def edit
  end

  # POST /broods
  # POST /broods.json
  def create
    @brood = Brood.new(brood_params)

    respond_to do |format|
      if @brood.save
        format.html { redirect_to @brood, notice: 'Brood was successfully created.' }
        format.json { render :show, status: :created, location: @brood }
      else
        format.html { render :new }
        format.json { render json: @brood.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /broods/1
  # PATCH/PUT /broods/1.json
  def update
    respond_to do |format|
      if @brood.update(brood_params)
        format.html { redirect_to @brood, notice: 'Brood was successfully updated.' }
        format.json { render :show, status: :ok, location: @brood }
      else
        format.html { render :edit }
        format.json { render json: @brood.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /broods/1
  # DELETE /broods/1.json
  def destroy
    @brood.destroy
    respond_to do |format|
      format.html { redirect_to broods_url, notice: 'Brood was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_brood
      @brood = Brood.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def brood_params
      params.require(:brood).permit(:name, :price)
    end
end
