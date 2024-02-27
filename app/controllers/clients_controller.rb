class ClientsController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_client, only: %i[show edit update destroy]

  layout 'devise'

  def show
  end

  def index
    @clients = Client.all.order("created_at DESC")
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to @client
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @client.update(client_params)
      flash[:notice] = "El cliente ha sido actualizado correctamente"
      redirect_to @client
    else
      render "edit"
    end
  end

  def destroy
    @client.destroy!
    flash[:notice] = "Cliente eliminado correctamente"
    redirect_to clients_path
  end

  private

    def client_params
      params.require(:client).permit(:name, :active, :phone, :location)
    end

    def set_client
      @client = Client.find(params[:id])
    end
    
end
