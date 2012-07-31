class QuestionsController < ApplicationController


  def new
    @question = Question.new
    @poll = Poll.find(params[:poll])
  end

  def create
    @poll = Poll.find(params[:poll_id])
    @question = Question.new(params[:question])
    @question.poll_id = @poll.id
    if @question.save
      redirect_to "/polls/#{@poll.id}/admin/#{@poll.admin_token}"
    else
      render "new"
    end
  end


  def edit
    @question = Question.find(params[:id])
  end


  def update
    @question = Question.find(params[:id])
    @poll = Question.find(params[:id]).poll
    @question.body = params[:question][:body]
    if @question.save
      redirect_to "/polls/#{@poll.id}/admin/#{@poll.admin_token}"
    else
      render "new"
    end
  end


  def destroy
    @poll = Question.find(params[:id]).poll
    Question.delete(params[:id])
    redirect_to "/polls/#{@poll.id}/admin/#{@poll.admin_token}"
  end

end
