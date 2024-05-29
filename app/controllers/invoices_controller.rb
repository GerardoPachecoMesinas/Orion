class InvoicesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_client, except: :index
  before_action :set_invoice, only: %i[ show edit update destroy ]

  # GET /invoices or /invoices.json
  def index
    @invoices = Invoice.all
  end

  # GET /invoice/1 or /invoice/1.json
  def show
  end

  # GET /invoice/new
  def new
    @invoice = @client.invoices.new
  end

  # POST /invoice or /invoice.json
  def create
    @invoice = @client.invoices.new(invoice_params)

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to client_url(@client, anchor: "invoice"), notice: "La factura fue creada correctamente." }
        format.json { render :show, status: :created, location: [@client, @invoice] }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /invoice/1/edit
  def edit
  end

  # PATCH/PUT /invoice/1 or /invoice/1.json
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to client_url(@client), notice: "La factura fue modificada correctamente." }
        format.json { render :show, status: :ok, location: [@client, @invoice] }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoice/1 or /invoice/1.json
  def destroy
    @invoice.destroy!

    respond_to do |format|
      format.html { redirect_to client_url(@client), notice: "La factura fue eliminada correctamente." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_client
    @client = Client.find(params[:client_id])
  end

# Use callbacks to share common setup or constraints between actions.
  def set_invoice
    @invoice = @client.invoices.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def invoice_params
    params.require(:invoice).permit(
      :service_package_name,
      :service_package_cost,
      :started_at,
      :disconnected_at,
      :finished_at,
      :additional_concept,
      :aditional_amount,
      :total_bill,
      :payment_status,
      :notes,
      :client_id,
      :service_package_id
    )
  end
end
