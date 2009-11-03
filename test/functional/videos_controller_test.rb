require 'test_helper'

class VideosControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Video.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Video.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Video.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to video_url(assigns(:video))
  end
  
  def test_edit
    get :edit, :id => Video.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Video.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Video.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Video.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Video.first
    assert_redirected_to video_url(assigns(:video))
  end
  
  def test_destroy
    video = Video.first
    delete :destroy, :id => video
    assert_redirected_to videos_url
    assert !Video.exists?(video.id)
  end
end
