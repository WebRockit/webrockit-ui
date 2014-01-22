class TypesController < ApplicationController
  def index
    render :layout => 'base'
  end

  def new
    #if there was a previous api call, get the status
    @apistatus = session[:api_errors]
    session[:api_errors] = nil

    render :layout => 'base'
  end

  def create
    createcall = Type.create(params)
  	if createcall == "ERROR"
      @apistatus = "ERROR"
      session[:api_errors] = @apistatus
    else 
      @result = JSON.parse(createcall)
    end
  	redirect_to :back
  end

  def destroy
    deletecall = Type.delete(params)
    if deletecall == "ERROR"
      @apistatus = "ERROR"
      session[:api_errors] = @apistatus
    else 
      @result = JSON.parse(deletecall)
    end
    redirect_to :back
  end
end
