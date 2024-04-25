class InvoicesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_client, except: :index
  before_action :set_invoice, only: %i[ show edit update destroy ]

  def show
  end

  def index
    @invoices = Invoice.all
  end

  def new
    @invoice = @client.invoices.build
  end

  def create
    @invoice = @client.invoices.build(invoice_params)

    if @invoice.save
      redirect_to @client
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @invoice.update(invoice_params)
      redirect_to @client, :notice => "Servicio modificado correctamente"
    else
      render 'edit'
    end
  end

  def destroy
    @invoice.destroy!
    redirect_to @client, :notice => "Servicio eliminado correctamente"
  end

  private

  def set_client
    @client = Client.find(params[:client_id])
  end

  def set_invoice
    @invoice = @client.invoices.find(params[:id])
  end

  def invoice_params
    params.require(:invoice).permit(
      :name, :started_at, :finished_at,
      :disconnected_at, :price, :paid_at, :notes, :client_id
    )
  end
end
