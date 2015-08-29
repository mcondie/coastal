class Admin::PhotosController < Comfy::Admin::Cms::BaseController

  before_action :build_photo,  :only => [:new, :create]
  before_action :load_photo,   :only => [:show, :edit, :update, :destroy]

  def index
    @photos = Photo.page(params[:page])
  end

  def show
    render
  end

  def new
    render
  end

  def edit
    render
  end

  def create
    @photo.save!
    flash[:success] = 'Photo created'
    redirect_to :action => :show, :id => @photo
  rescue ActiveRecord::RecordInvalid
    flash.now[:danger] = 'Failed to create Photo'
    render :action => :new
  end

  def update
    @photo.update_attributes!(photo_params)
    flash[:success] = 'Photo updated'
    redirect_to :action => :show, :id => @photo
  rescue ActiveRecord::RecordInvalid
    flash.now[:danger] = 'Failed to update Photo'
    render :action => :edit
  end

  def destroy
    @photo.destroy
    flash[:success] = 'Photo deleted'
    redirect_to :action => :index
  end

protected

  def build_photo
    @photo = Photo.new(photo_params)
  end

  def load_photo
    @photo = Photo.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:danger] = 'Photo not found'
    redirect_to :action => :index
  end

  def photo_params
    params.fetch(:photo, {}).permit(:title, :description)
  end
end