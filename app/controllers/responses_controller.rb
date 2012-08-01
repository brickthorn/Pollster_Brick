class ResponsesController < ApplicationController

  def new
    @poll = Poll.find(params[:poll_id])
    @questions = @poll.questions
    @response = Response.new
  end

  def create
    response = Response.create(params[:response])
    params.each_pair do |k,v|
      Answer.create(:question_id => k.split("-")[1], :body => v, :response_id => @response_id) if k.include? "answer"
    end
    warn "IN THE CREATE of RESPONSES CONTROLLER"
  end

  def show
  end

  def destroy
  end
end
