require 'test_helper'

class PlaintextsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Plaintext.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Plaintext.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Plaintext.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to plaintext_url(assigns(:plaintext))
  end
  
  def test_edit
    get :edit, :id => Plaintext.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Plaintext.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Plaintext.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Plaintext.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Plaintext.first
    assert_redirected_to plaintext_url(assigns(:plaintext))
  end
  
  def test_destroy
    plaintext = Plaintext.first
    delete :destroy, :id => plaintext
    assert_redirected_to plaintexts_url
    assert !Plaintext.exists?(plaintext.id)
  end
end
