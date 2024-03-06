class ServicesController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_service, only: %i[ show edit update destroy ]
  
  layout 'devise'

  def index
    @services = Service.all.order("created_at DESC")
  end

  def show
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.create(service_params)
    if @service.save
      redirect_to @service
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @service.update(service_params)
      flash[:notice] = "servicio modificado correctamente"
      redirect_to @service
    else
      render 'edit'
    end
  end

  def destroy
    @service.destroy!

    respond_to do |format|
      format.html { redirect_to services_path, notice: "Servicio eliminado correctamente" }
      format.json { head :no_content }
    end
  end

  private

    def set_service
      @service = Service.find(params[:id])
    end

    def service_params
      params.require(:service).permit(:name, :started_at, :finished_at, :disconnected_at, :price, :paid_at, :notes, :client_id)
    end
end
