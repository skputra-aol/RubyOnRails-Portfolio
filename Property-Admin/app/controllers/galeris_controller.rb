class GalerisController < ApplicationController
  before_action :set_galeri, only: %i[ show edit update destroy ]
  before_action :authenticate_account!
  before_action :set_sidebar
  
  # GET /galeris or /galeris.json
  def index
    @galeris = Galeri.all
  end

  # GET /galeris/1 or /galeris/1.json
  def show
  end

  # GET /galeris/new
  def new
    @galeri = Galeri.new
  end

  # GET /galeris/1/edit
  def edit
  end

  # POST /galeris or /galeris.json
  def create
    @galeri = Galeri.new(galeri_params)
    @galeri.Account = current_account

    respond_to do |format|
      if @galeri.save
        format.html { redirect_to galeri_url(@galeri), notice: "Galeri was successfully created." }
        format.json { render :show, status: :created, location: @galeri }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @galeri.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /galeris/1 or /galeris/1.json
  def update
    respond_to do |format|
      if @galeri.update(galeri_params)
        format.html { redirect_to galeri_url(@galeri), notice: "Galeri was successfully updated." }
        format.json { render :show, status: :ok, location: @galeri }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @galeri.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /galeris/1 or /galeris/1.json
  def destroy
    @galeri.destroy

    respond_to do |format|
      format.html { redirect_to galeris_url, notice: "Galeri was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_galeri
      @galeri = Galeri.find(params[:id])
    end
    ## declare main globar var "@show_sidebar"
    def set_sidebar
      @show_sidebar = true
    end
    # Only allow a list of trusted parameters through.
    def galeri_params
      params.require(:galeri).permit(:title, :content, :image)
    end
end
