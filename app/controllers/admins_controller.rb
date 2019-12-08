class AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :edit, :update, :destroy]

  # GET /admins
  # GET /admins.json
  def index
    if @admin = nil
      redirect_to root_url
    end
    @admins = Admin.all
    @payments = Payment.search(params[:term], params[:category])
  end

  # GET /admins/1
  # GET /admins/1.json
  def show
    if @admin = nil
      redirect_to root_url
    end
  end

  # GET /admins/new
  def new
    @admin = Admin.new
  end

  # GET /admins/1/edit
  def edit
    if @admin = nil
      redirect_to root_url
    end
  end

  # POST /admins
  # POST /admins.json
  def create
    @email = "admin@user.com"
    @password = "password"

    @admin = Admin.new(admin_params)

    respond_to do |format|
      if @admin.password_congregate == @password && @admin.email == @email
        format.html { redirect_to admins_path(@admin), notice: 'Admin was successfully created.' }
        format.json { render :show, status: :created, location: @admin }
      else
        format.html { render :new, notice: 'Wrong email or password' }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admins/1
  # PATCH/PUT /admins/1.json
  def update
    if @admin = nil
      redirect_to root_url
    end

    respond_to do |format|
      if @admin.update(admin_params)
        format.html { redirect_to @admin, notice: 'Admin was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin }
      else
        format.html { render :edit }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/1
  # DELETE /admins/1.json
  def destroy
    if @admin = nil
      redirect_to root_url
    end

    @admin.destroy
    respond_to do |format|
      format.html { redirect_to admins_url, notice: 'Admin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = Admin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_params
      params.require(:admin).permit(:email, :password_congregate, :term, :category)
    end
end
