class ServicesController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_client
  
  layout 'devise'

  def show
    @service = @client.services.find(params[:id])
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
    @service = @client.services.find(params[:id])
  end

  def update
    @service = @client.services.find(params[:id])
    if @service.update(service_params)
      redirect_to @client, :notice => "Servicio modificado correctamente"
    else
      render 'edit'
    end
  end

  def destroy
    @service = @client.services.find(params[:id])
    @service.destroy!
    redirect_to @client, :notice => "Servicio eliminado correctamente"
  end

  private

  def set_client
    @client = Client.find(params[:client_id])
  end

  def service_params
    params.require(:service).permit(:name, :started_at, :finished_at, :disconnected_at, :price, :paid_at, :notes, :client_id)
  end
end
