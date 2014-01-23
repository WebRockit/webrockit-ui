class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_types

  def set_types
    typescall = Type.list
    if typescall == "ERROR"
      @apistatus = "ERROR"
    else
      @check_types = JSON.parse(typescall)['data']
    end
  end
end
