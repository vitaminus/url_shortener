class ApplicationController < ActionController::Base
  protect_from_forgery

  def ip
    @links = Link.where('ip = ?', request.remote_ip).order("id DESC").page(params[:page]).per_page(10)
  end

end
