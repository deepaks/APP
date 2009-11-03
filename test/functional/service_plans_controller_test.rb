require 'test_helper'

class ServicePlansControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:service_plans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create service_plan" do
    assert_difference('ServicePlan.count') do
      post :create, :service_plan => { }
    end

    assert_redirected_to service_plan_path(assigns(:service_plan))
  end

  test "should show service_plan" do
    get :show, :id => service_plans(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => service_plans(:one).to_param
    assert_response :success
  end

  test "should update service_plan" do
    put :update, :id => service_plans(:one).to_param, :service_plan => { }
    assert_redirected_to service_plan_path(assigns(:service_plan))
  end

  test "should destroy service_plan" do
    assert_difference('ServicePlan.count', -1) do
      delete :destroy, :id => service_plans(:one).to_param
    end

    assert_redirected_to service_plans_path
  end
end
