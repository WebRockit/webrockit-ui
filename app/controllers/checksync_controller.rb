class ChecksyncController < ApplicationController
  def index
    render :layout => 'base'
  end

  def create
    Checksync.import(params['type']) if params['formtype'] == 'import'
    Checksync.load() if params['formtype'] == 'load'
    redirect_to :back
  end
end
