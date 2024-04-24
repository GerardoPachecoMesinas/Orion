class ServicesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_client, except: :index
  before_action :set_service, only: %i[ show edit update destroy ]

  def show
  end

  def index
    @services = Service.all
  end

  def new
    @service = @client.services.build
  end

  def create
    @service = @client.services.build(service_params)
    if @service.save
      redirect_to @client
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @service.update(service_params)
      redirect_to @client, :notice => "Servicio modificado correctamente"
    else
      render 'edit'
    end
  end

  def destroy
    @service.destroy!
    redirect_to @client, :notice => "Servicio eliminado correctamente"
  end

  private

  def set_client
    @client = Client.find(params[:client_id])
  end

  def set_service
    @service = @client.services.find(params[:id])
  end

  def service_params
    params.require(:service).permit(
      :name, :started_at, :finished_at,
      :disconnected_at, :price, :paid_at, :notes, :client_id
    )
  end
end
