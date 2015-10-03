require_relative '../../test_helper'

class Admin::CategoriesControllerTest < ActionController::TestCase

  def setup
    # TODO: login as admin user
    @category = categories(:default)
  end

  def test_get_index
    get :index
    assert_response :success
    assert assigns(:categories)
    assert_template :index
  end

  def test_get_show
    get :show, :id => @category
    assert_response :success
    assert assigns(:category)
    assert_template :show
  end

  def test_get_show_failure
    get :show, :id => 'invalid'
    assert_response :redirect
    assert_redirected_to :action => :index
    assert_equal 'Category not found', flash[:danger]
  end

  def test_get_new
    get :new
    assert_response :success
    assert assigns(:category)
    assert_template :new
    assert_select "form[action='/admin/categories']"
  end

  def test_get_edit
    get :edit, :id => @category
    assert_response :success
    assert assigns(:category)
    assert_template :edit
    assert_select "form[action='/admin/categories/#{@category.id}']"
  end

  def test_creation
    assert_difference 'Category.count' do
      post :create, :category => {
        :name => 'test name',
        :description => 'test description',
        :parent => 'test parent',
      }
      category = Category.last
      assert_response :redirect
      assert_redirected_to :action => :show, :id => category
      assert_equal 'Category created', flash[:success]
    end
  end

  def test_creation_failure
    assert_no_difference 'Category.count' do
      post :create, :category => { }
      assert_response :success
      assert_template :new
      assert_equal 'Failed to create Category', flash[:danger]
    end
  end

  def test_update
    put :update, :id => @category, :category => {
      :name => 'Updated'
    }
    assert_response :redirect
    assert_redirected_to :action => :show, :id => @category
    assert_equal 'Category updated', flash[:success]
    @category.reload
    assert_equal 'Updated', @category.name
  end

  def test_update_failure
    put :update, :id => @category, :category => {
      :name => ''
    }
    assert_response :success
    assert_template :edit
    assert_equal 'Failed to update Category', flash[:danger]
    @category.reload
    refute_equal '', @category.name
  end

  def test_destroy
    assert_difference 'Category.count', -1 do
      delete :destroy, :id => @category
      assert_response :redirect
      assert_redirected_to :action => :index
      assert_equal 'Category deleted', flash[:success]
    end
  end
end