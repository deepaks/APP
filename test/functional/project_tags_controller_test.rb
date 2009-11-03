require 'test_helper'

class ProjectTagsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_tags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_tag" do
    assert_difference('ProjectTag.count') do
      post :create, :project_tag => { }
    end

    assert_redirected_to project_tag_path(assigns(:project_tag))
  end

  test "should show project_tag" do
    get :show, :id => project_tags(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => project_tags(:one).to_param
    assert_response :success
  end

  test "should update project_tag" do
    put :update, :id => project_tags(:one).to_param, :project_tag => { }
    assert_redirected_to project_tag_path(assigns(:project_tag))
  end

  test "should destroy project_tag" do
    assert_difference('ProjectTag.count', -1) do
      delete :destroy, :id => project_tags(:one).to_param
    end

    assert_redirected_to project_tags_path
  end
end
