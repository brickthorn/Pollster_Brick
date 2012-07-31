class ResponsesController < ApplicationController

  def new
    @poll = Poll.find(params[:poll_id])
    @response = Response.new
    3.times { @response.answers.build }
  end

  def create
  end

  def show
  end

  def destroy
  end
end
