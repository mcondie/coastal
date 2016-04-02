class Admin::NotesController < Comfy::Admin::Cms::BaseController

  before_action :build_note,  :only => [:new, :create]
  before_action :load_note,   :only => [:show, :edit, :update, :destroy]
  before_action :load_photo

  def index
    @notes = @photo.notes
  end

  def show
    render
  end

  def new
    @note.x = '0'
    @note.y = '0'
    render
  end

  def edit
    render
  end

  def create
    @note.photo_id = @photo.id
    @note.save!
    flash[:success] = 'Note created'
    redirect_to :action => :show, :id => @note
  rescue ActiveRecord::RecordInvalid
    flash.now[:danger] = 'Failed to create Note'
    render :action => :new
  end

  def update
    @note.update_attributes!(note_params)
    flash[:success] = 'Note updated'
    redirect_to :action => :show, :id => @note
  rescue ActiveRecord::RecordInvalid
    flash.now[:danger] = 'Failed to update Note'
    render :action => :edit
  end

  def destroy
    @note.destroy
    flash[:success] = 'Note deleted'
    redirect_to :action => :index
  end

protected

  def load_photo
    @photo = Photo.find(params[:photo_id])
  end


  def build_note
    @note = Note.new(note_params)
  end

  def load_note
    @note = Note.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:danger] = 'Note not found'
    redirect_to :action => :index
  end

  def note_params
    params.fetch(:note, {}).permit(:name, :description, :photo, :x, :y)
  end
end