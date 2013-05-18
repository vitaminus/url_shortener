# encoding: UTF-8
class LinksController < ApplicationController
  before_filter :authenticate, only: :admin

  def new
    @link = Link.new
  end
  
  def show
    @link = Link.find_by_short_link(params[:short_link])
    @link.counts
    @link.save
    if @link.password
      #redirect_to @link.full_link
    else
      redirect_to @link.full_link
    end
  end

  def create
    @link = Link.new(params[:link])
    if @link.save
      flash[:success] = "Short link created: #{root_url}#{@link.short_link}"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def admin
    if authenticate
      @links = Link.page(params[:page]).per_page(10)
    else
      redirect_to root_path
    end
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    flash[:success] = "Link deleted successfull"
    redirect_to admin_path
  end

  private

    def authenticate
      authenticate_or_request_with_http_basic('Administration') do |username, password|
        #password - birds
        md5_of_password = Digest::MD5.hexdigest(password)
        username == 'admin' && md5_of_password == '75c73f175a85cee384f32a5608eb67d1'
    end
  end
end