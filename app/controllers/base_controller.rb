class BaseController < ApplicationController
  def index
    render :layout => 'base'
  end
end
