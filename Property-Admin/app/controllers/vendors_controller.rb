class VendorsController < ApplicationController
  before_action :set_vendor, only: %i[ show edit update destroy ]
  before_action :set_sidebar
  before_action :set_sidebar, except: [:index]
  
  # GET /vendors or /vendors.json
  def index

    @q =  VendorService::QueryVendor.call(params[:q]) 
    @vendors = @q.result.page(params[:page])
    
  end

  # GET /vendors/1 or /vendors/1.json
  def show
  end

  # GET /vendors/new
  def new
    @vendor = Vendor.new
  end

  # GET /vendors/1/edit
  def edit
  end

  # POST /vendors or /vendors.json
  def create
    @vendor = VendorService::CommandVendor.call(vendor_params)

    respond_to do |format|
      if @vendor.save
        format.html { redirect_to vendor_url(@vendor), notice: "Vendor was successfully created." }
        format.json { render :show, status: :created, location: @vendor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vendors/1 or /vendors/1.json
  def update
    respond_to do |format|
      if @vendor.update(vendor_params)
        format.html { redirect_to vendor_url(@vendor), notice: "Vendor was successfully updated." }
        format.json { render :show, status: :ok, location: @vendor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vendors/1 or /vendors/1.json
  def destroy
    @vendor.destroy

    respond_to do |format|
      format.html { redirect_to vendors_url, notice: "Vendor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vendor
      @vendor = VendorService::QueryVendor.call(params)   #Vendor.find(params[:id])
    end


   ## declare main globar var "@show_sidebar"
    def set_sidebar
      @show_sidebar = true
    end      

    # Only allow a list of trusted parameters through.
    def vendor_params
      params.require(:vendor).permit(:refno, :name, :person, :address, :phone, :status, :category)
    end
end