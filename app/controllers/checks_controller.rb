class ChecksController < ApplicationController

  def index
    @type = params[:id]
    render :layout => 'base'
  end

  def new
    @type = params[:id]
    #if there was a previous api call, get the status
    @apistatus = session[:api_errors]
    session[:api_errors] = nil

  	#do not need to grab the check types as those are fetched for the navbar

  	# fetch poller locations
    pollerscall = Poller.list
  	if pollerscall == "ERROR"
  		@apistatus = "ERROR"
  	else
  		@poller_locations = JSON.parse(pollerscall)['data']
  	end
    render :layout => 'base'
  end

  def create
    createcall = Check.create(params)
  	if createcall == "ERROR"
      @apistatus = "ERROR"
      session[:api_errors] = @apistatus
    else
      @result = JSON.parse(createcall)
    end
  	redirect_to :back
  end

  def destroy
    deletecall = Check.delete(params)
    if deletecall == "ERROR"
      @apistatus = "ERROR"
      session[:api_errors] = @apistatus
    else
      @result = JSON.parse(deletecall)
    end
    redirect_to :back
  end

  def show
    type = params['id']
    term = params['q']
    checks = Check.select2Fetch(type,term)

    render json: checks
  end
end
