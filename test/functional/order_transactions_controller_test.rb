require 'test_helper'

class OrderTransactionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:order_transactions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order_transaction" do
    assert_difference('OrderTransaction.count') do
      post :create, :order_transaction => { }
    end

    assert_redirected_to order_transaction_path(assigns(:order_transaction))
  end

  test "should show order_transaction" do
    get :show, :id => order_transactions(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => order_transactions(:one).to_param
    assert_response :success
  end

  test "should update order_transaction" do
    put :update, :id => order_transactions(:one).to_param, :order_transaction => { }
    assert_redirected_to order_transaction_path(assigns(:order_transaction))
  end

  test "should destroy order_transaction" do
    assert_difference('OrderTransaction.count', -1) do
      delete :destroy, :id => order_transactions(:one).to_param
    end

    assert_redirected_to order_transactions_path
  end
end
