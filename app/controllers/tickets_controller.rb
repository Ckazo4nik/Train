class TicketsController < ApplicationController
  before_action :find_train, only: [:index]
  before_action :find_ticket, only: [:show, :edit, :destroy, :update]

  def index
    @tickets = Ticket.all
    respond_with(@tickets)
  end

  def new
    respond_with(@ticket = Ticket.new)
  end

  def show
    respond_with(@ticket)
  end

  def edit
    respond_with(@ticket)
  end

  def create
    @ticket = @train.create(ticket_params,merge(user_id: @current_user.id))
    respond_with(@ticket)
  end

  def update
    @ticket.update(ticket_params)
    respond_with(@ticket)
  end

  def destroy
    respond_with(@ticket.destroy)
  end

  private

  def ticket_params
    params.require(:ticket).permit(:user_id, :train_id)
  end

  def find_train
    @train = Train.find(params[:train_id])
  end
  def find_ticket
    @ticket = Ticket.find(params[:id])
  end
end
