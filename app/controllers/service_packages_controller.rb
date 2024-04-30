class ServicePackagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_service_package, only: %i[ show edit update destroy ]

  def index
    @service_packages = ServicePackage.all
  end

  def show
  end

  def new
    @service_package = ServicePackage.new
  end

  def edit
  end

  def create
    @service_package = ServicePackage.new(service_package_params)

    respond_to do |format|
      if @service_package.save
        format.html { redirect_to service_package_url(@service_package), notice: "Service package was successfully created." }
        format.json { render :show, status: :created, location: @service_package }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @service_package.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @service_package.update(service_package_params)
        format.html { redirect_to service_package_url(@service_package), notice: "Service package was successfully updated." }
        format.json { render :show, status: :ok, location: @service_package }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @service_package.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @service_package.destroy!

    respond_to do |format|
      format.html { redirect_to service_packages_url, notice: "Service package was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_service_package
      @service_package = ServicePackage.find(params[:id])
    end

    def service_package_params
      params.require(:service_package).permit(:name, :price, :bandwidth, :clasification)
    end
end
