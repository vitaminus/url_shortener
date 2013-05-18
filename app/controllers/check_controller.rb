class CheckController < ApplicationController
  def new
  end

  def create
    link = Link.check_password(params[:check_password])
    if link
      redirect_to link.full_link
    else
      flash.now[:error] = "Link not exist"
      render 'new'
    end
  end

  def show
  end
end
