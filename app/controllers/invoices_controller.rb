class InvoicesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_client, except: :general_index
  before_action :set_invoice, only: %i[show edit update destroy]

  # This acction filters any invoice using its attributes
  def general_index
    @all_invoices = Invoice.all

    if params[:start_date].present? && params[:end_date].present?
      start_date = Date.parse(params[:start_date]).beginning_of_day
      end_date = Date.parse(params[:end_date]).end_of_day
      @all_invoices = @all_invoices.where(started_at: start_date..end_date)
    end

    if params[:payment_status].present?
      @all_invoices = @all_invoices.where(payment_status: params[:payment_status].gsub("_", " "))
    end

    if params[:service_package_name].present?
      @all_invoices = @all_invoices.where(service_package_name: params[:service_package_name])
    end

    if params[:name].present?
      @all_invoices = @all_invoices.joins(:client).where("LOWER(clients.name) LIKE ?", "%#{params[:name].downcase}%")
    end

    @all_invoices = @all_invoices.order(started_at: :desc)
  end

  # GET /invoices or /invoices.json
  def index
    @invoices = @client.invoices.all
  end

  # GET /invoice/1 or /invoice/1.json
  def show
  end

  # GET /invoice/new
  def new
    @invoice = @client.invoices.new
    @service_package_selected = ServicePackage.find_by(name: "Sin Definir").id
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
    @service_package_selected = @invoice.service_package.id
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
