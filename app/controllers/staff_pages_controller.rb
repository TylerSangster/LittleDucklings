class StaffPagesController < ApplicationController
  before_action :set_staff_page, only: %i[ show edit update destroy ]

  # GET /staff_pages or /staff_pages.json
  def index
    @staff_pages = StaffPage.all
  end

  # GET /staff_pages/1 or /staff_pages/1.json
  def show
  end

  # GET /staff_pages/new
  def new
    @staff_page = StaffPage.new
  end

  # GET /staff_pages/1/edit
  def edit
  end

  # POST /staff_pages or /staff_pages.json
  def create
    @staff_page = StaffPage.new(staff_page_params)

    respond_to do |format|
      if @staff_page.save
        format.html { redirect_to @staff_page, notice: "Staff page was successfully created." }
        format.json { render :show, status: :created, location: @staff_page }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @staff_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /staff_pages/1 or /staff_pages/1.json
  def update
    respond_to do |format|
      if @staff_page.update(staff_page_params)
        format.html { redirect_to @staff_page, notice: "Staff page was successfully updated." }
        format.json { render :show, status: :ok, location: @staff_page }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @staff_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /staff_pages/1 or /staff_pages/1.json
  def destroy
    @staff_page.destroy
    respond_to do |format|
      format.html { redirect_to staff_pages_url, notice: "Staff page was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_staff_page
      @staff_page = StaffPage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def staff_page_params
      params.require(:staff_page).permit(:name, :cover_photo, :slug, :location, :state, :published_at, :created_at, :updaated_at, :body, {})
    end
end
