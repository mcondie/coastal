require_relative '../../test_helper'

class Admin::NotesControllerTest < ActionController::TestCase

  def setup
    # TODO: login as admin user
    @note = notes(:default)
  end

  def test_get_index
    get :index
    assert_response :success
    assert assigns(:notes)
    assert_template :index
  end

  def test_get_show
    get :show, :id => @note
    assert_response :success
    assert assigns(:note)
    assert_template :show
  end

  def test_get_show_failure
    get :show, :id => 'invalid'
    assert_response :redirect
    assert_redirected_to :action => :index
    assert_equal 'Note not found', flash[:danger]
  end

  def test_get_new
    get :new
    assert_response :success
    assert assigns(:note)
    assert_template :new
    assert_select "form[action='/admin/notes']"
  end

  def test_get_edit
    get :edit, :id => @note
    assert_response :success
    assert assigns(:note)
    assert_template :edit
    assert_select "form[action='/admin/notes/#{@note.id}']"
  end

  def test_creation
    assert_difference 'Note.count' do
      post :create, :note => {
        :name => 'test name',
        :description => 'test description',
        :photo => 'test photo',
      }
      note = Note.last
      assert_response :redirect
      assert_redirected_to :action => :show, :id => note
      assert_equal 'Note created', flash[:success]
    end
  end

  def test_creation_failure
    assert_no_difference 'Note.count' do
      post :create, :note => { }
      assert_response :success
      assert_template :new
      assert_equal 'Failed to create Note', flash[:danger]
    end
  end

  def test_update
    put :update, :id => @note, :note => {
      :name => 'Updated'
    }
    assert_response :redirect
    assert_redirected_to :action => :show, :id => @note
    assert_equal 'Note updated', flash[:success]
    @note.reload
    assert_equal 'Updated', @note.name
  end

  def test_update_failure
    put :update, :id => @note, :note => {
      :name => ''
    }
    assert_response :success
    assert_template :edit
    assert_equal 'Failed to update Note', flash[:danger]
    @note.reload
    refute_equal '', @note.name
  end

  def test_destroy
    assert_difference 'Note.count', -1 do
      delete :destroy, :id => @note
      assert_response :redirect
      assert_redirected_to :action => :index
      assert_equal 'Note deleted', flash[:success]
    end
  end
end