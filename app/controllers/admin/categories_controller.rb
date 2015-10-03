class Admin::CategoriesController < Comfy::Admin::Cms::BaseController
  before_action :build_category,  :only => [:new, :create]
  before_action :load_category,   :only => [:show, :edit, :update, :destroy]

  def index
    @categories = Category.page(params[:page])
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
    @category.save!
    flash[:success] = 'Category created'
    redirect_to :action => :show, :id => @category
  rescue ActiveRecord::RecordInvalid
    flash.now[:danger] = 'Failed to create Category'
    render :action => :new
  end

  def update
    if params[:parent].blank?
      params[:parent] = nil
    end
    @category.update_attributes!(category_params)
    flash[:success] = 'Category updated'
    redirect_to :action => :show, :id => @category
  rescue ActiveRecord::RecordInvalid
    flash.now[:danger] = 'Failed to update Category'
    render :action => :edit
  end

  def destroy
    @category.destroy
    flash[:success] = 'Category deleted'
    redirect_to :action => :index
  end

protected

  def build_category
    @category = Category.new(category_params)
  end

  def load_category
    @category = Category.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:danger] = 'Category not found'
    redirect_to :action => :index
  end

  def category_params
    params.fetch(:category, {}).permit(:name, :description, :parent_id, :image, :key)
  end
end