class TicketsController < ApplicationController
  before_action :require_user, except: [:index, :show]

  def index
    @tickets = filtered_tickets
  end

  def show
    @ticket = Ticket.find(params[:id])
    @comment = Comment.new(user_id: current_user.id, ticket_id: @ticket.id) if logged_in?
  end

  def new
    @ticket = Ticket.new
    @projects = Project.all
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.creator = current_user
    if @ticket.save
      flash[:notice] = 'Ticket created'
      redirect_to tickets_path
    else
      @projects = Project.all
      render :new
    end
  end

  def edit
    @ticket = Ticket.find(params[:id])
    @projects = Project.all
  end

  def update
    @ticket = Ticket.find(params[:id])
    if @ticket.update(ticket_params)
      flash[:notice] = 'Ticket updated'
      redirect_to ticket_path(@ticket)
    else
      @projects = Project.all
      render :edit
    end
  end

  def destroy
    if Ticket.destroy(params[:id])
      flash[:notice] = 'Ticket deleted'
      redirect_to tickets_path
    else
      flash[:error] = 'Something went wrong; ticket not deleted'
      render :index
    end
  end

  private

  def ticket_params    
    params.require(:ticket).permit(:project_id, :name, :body, :status, :assignee_id, tag_ids: [])
  end

  def filtered_tickets
    filter = generate_filter
    if filter[:ticket_tags]
      Ticket.joins(:ticket_tags).where(filter)
    else
      Ticket.where(filter)
    end
  end

  def generate_filter
    filter = {}
    proj = params['project']
    filter[:project_id] = proj if proj != nil && proj.match(/^\d+$/)
    stat = params['status']
    filter[:status] = stat if Ticket.statuses.key?(stat)
    tag = params['tag']
    if tag != nil && tag.match(/^\d+$/)
      filter[:ticket_tags] = { tag_id: tag }
    end
    filter
  end

end