class PollsController < ApplicationController

  def index
    @polls = Poll.all
    # show list of all polls for the user
  end


  def new
    @poll = Poll.new
  end


  def create
    @poll = Poll.new(params[:poll])
    if !@poll.save
      render "new"
    else
      redirect_to "/polls/#{@poll.id}/admin/#{@poll.admin_token}"
    end
  end


  def edit
    # find the poll_id from the passed :id key (which is actually the :admin_token key)
    poll_id = params[:id]
    @poll = Poll.find_by_admin_token(poll_id)
  end


  def update
    @poll = Poll.find(params[:id])
    if !@poll.save
      render "new"
    else
      redirect_to "/polls/#{@poll.id}/admin/#{@poll.admin_token}"
    end
  end


  def show
    if params[:admin_token]
      @admin_key = params[:admin_token]
    end
    @poll = Poll.find(params[:id])
    # this can be delineated by the url 'take_poll/'
  end

end
