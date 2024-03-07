class ServicesController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_client
  
  layout 'devise'

  def new
    @service = @client.services.build
  end

  def create
    @service = @client.services.build(service_params)
    if @service.save
      redirect_to client_service_path(@client, @service)
    else
      render 'new'
    end
  end

  private

  def set_client
    @client = Client.find(params[:client_id])
  end

  def service_params
    params.require(:service).permit(:name, :started_at, :finished_at, :disconnected_at, :price, :paid_at, :notes, :client_id)
  end
end
