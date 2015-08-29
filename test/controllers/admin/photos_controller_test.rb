require_relative '../../test_helper'

class Admin::PhotosControllerTest < ActionController::TestCase

  def setup
    # TODO: login as admin user
    @photo = photos(:default)
  end

  def test_get_index
    get :index
    assert_response :success
    assert assigns(:photos)
    assert_template :index
  end

  def test_get_show
    get :show, :id => @photo
    assert_response :success
    assert assigns(:photo)
    assert_template :show
  end

  def test_get_show_failure
    get :show, :id => 'invalid'
    assert_response :redirect
    assert_redirected_to :action => :index
    assert_equal 'Photo not found', flash[:danger]
  end

  def test_get_new
    get :new
    assert_response :success
    assert assigns(:photo)
    assert_template :new
    assert_select "form[action='/admin/photos']"
  end

  def test_get_edit
    get :edit, :id => @photo
    assert_response :success
    assert assigns(:photo)
    assert_template :edit
    assert_select "form[action='/admin/photos/#{@photo.id}']"
  end

  def test_creation
    assert_difference 'Photo.count' do
      post :create, :photo => {
        :title => 'test title',
        :description => 'test description',
      }
      photo = Photo.last
      assert_response :redirect
      assert_redirected_to :action => :show, :id => photo
      assert_equal 'Photo created', flash[:success]
    end
  end

  def test_creation_failure
    assert_no_difference 'Photo.count' do
      post :create, :photo => { }
      assert_response :success
      assert_template :new
      assert_equal 'Failed to create Photo', flash[:danger]
    end
  end

  def test_update
    put :update, :id => @photo, :photo => {
      :title => 'Updated'
    }
    assert_response :redirect
    assert_redirected_to :action => :show, :id => @photo
    assert_equal 'Photo updated', flash[:success]
    @photo.reload
    assert_equal 'Updated', @photo.title
  end

  def test_update_failure
    put :update, :id => @photo, :photo => {
      :title => ''
    }
    assert_response :success
    assert_template :edit
    assert_equal 'Failed to update Photo', flash[:danger]
    @photo.reload
    refute_equal '', @photo.title
  end

  def test_destroy
    assert_difference 'Photo.count', -1 do
      delete :destroy, :id => @photo
      assert_response :redirect
      assert_redirected_to :action => :index
      assert_equal 'Photo deleted', flash[:success]
    end
  end
end