class PropertiesController < ApplicationController
  before_action :set_property, only: %i[ show edit update destroy ] #sama %[ :show, :edit, :update, :destroy ]
  before_action :authenticate_account!, only: [:new,:create,:destroy]
  before_action :set_sidebar, except: [:show]

  # GET /properties or /properties.json
  ## first set @properties
  def index
    @properties = Property.all
  end

  # GET /properties/1 or /properties/1.json
  ## first set @agent
  def show
    
    @agent = @property.account
  end

  # GET /properties/new
  def new
    @property = Property.new
  end

  # GET /properties/1/edit
  def edit
  end

  # POST /properties or /properties.json
  def create
    @property = Property.new(property_params)
    @property.account_id = current_account.id

    respond_to do |format|
      if @property.save
        format.html { redirect_to properties_url, notice: "Property was successfully created." }
        format.json { head :no_content }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1 or /properties/1.json
  #      if @property.update(name: params[:name], price: params[:price] ,rooms: params[:rooms],bathrooms: params[:bathrooms],photo: params[:photo])
        
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to properties_url, notice: "Property was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1 or /properties/1.json
  def destroy
    @property.destroy

    respond_to do |format|
      format.html { redirect_to properties_url, notice: "Property was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

      ## declare main globar var "@show_sidebar"
    def set_sidebar
      @show_sidebar = true
    end

    # Only allow a list of trusted parameters through.
    def property_params
      params.require(:property).permit(:name, :price, :rooms, :bathrooms, :photo)
    end
end
