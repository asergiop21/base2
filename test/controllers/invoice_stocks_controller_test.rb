require 'test_helper'

class InvoiceStocksControllerTest < ActionController::TestCase
  setup do
    @invoice_stock = invoice_stocks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:invoice_stocks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create invoice_stock" do
    assert_difference('InvoiceStock.count') do
      post :create, invoice_stock: { name: @invoice_stock.name }
    end

    assert_redirected_to invoice_stock_path(assigns(:invoice_stock))
  end

  test "should show invoice_stock" do
    get :show, id: @invoice_stock
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @invoice_stock
    assert_response :success
  end

  test "should update invoice_stock" do
    patch :update, id: @invoice_stock, invoice_stock: { name: @invoice_stock.name }
    assert_redirected_to invoice_stock_path(assigns(:invoice_stock))
  end

  test "should destroy invoice_stock" do
    assert_difference('InvoiceStock.count', -1) do
      delete :destroy, id: @invoice_stock
    end

    assert_redirected_to invoice_stocks_path
  end
end
