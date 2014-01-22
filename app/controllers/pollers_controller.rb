class PollersController < ApplicationController
  def index
    # fetch poller locations
    pollerscall = Poller.list
    if pollerscall == "ERROR"
      @apistatus = "ERROR"
    else
      @pollers = JSON.parse(pollerscall)['data']
    end
    
    render :layout => 'base'
  end

  def new
    #if there was a previous api call, get the status
    @apistatus = session[:api_errors]
    session[:api_errors] = nil

    render :layout => 'base'
  end

  def create
    createcall = Poller.create(params)
    if createcall == "ERROR"
      @apistatus = "ERROR"
      session[:api_errors] = @apistatus
    else 
      @result = JSON.parse(createcall)
    end
    redirect_to :back
  end

  def destroy
    deletecall = Poller.delete(params)
    if deletecall == "ERROR"
      @apistatus = "ERROR"
      session[:api_errors] = @apistatus
    else 
      @result = JSON.parse(deletecall)
    end
    redirect_to :back
  end
end
