class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_client
  before_action :set_ticket, only: %i[ show edit update destroy ]

  def show
  end

  def new
    @ticket = @client.tickets.build
  end

  def edit
  end

  def create
    @ticket = @client.tickets.build(ticket_params)
    respond_to do |format|
      if @ticket.save
        format.html {
          redirect_to client_ticket_path(@client, @ticket),
          notice: "Ticket was successfully created."
        }
        format.json { render :show, status: :created, location: [@client, @ticket] }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: [@client, @ticket].errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html {
          redirect_to client_ticket_path([@client, @ticket]),
          notice: "Ticket was successfully updated."
        }
        format.json { render :show, status: :ok, location: [@client, @ticket] }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: [@client, @ticket].errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @ticket.destroy!

    respond_to do |format|
      format.html { redirect_to @client, notice: "Ticket was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def set_client
    @client = Client.find(params[:client_id])
  end

  def set_ticket
    @ticket = @client.tickets.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(
      :created_at, :status, :priority_level, :description, :client_id
    )
  end
end
