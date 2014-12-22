require 'test_helper'

class AccountingRecordsControllerTest < ActionController::TestCase
  setup do
    @accounting_record = accounting_records(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accounting_records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create accounting_record" do
    assert_difference('AccountingRecord.count') do
      post :create, accounting_record: { credit: @accounting_record.credit, debit: @accounting_record.debit, detail: @accounting_record.detail }
    end

    assert_redirected_to accounting_record_path(assigns(:accounting_record))
  end

  test "should show accounting_record" do
    get :show, id: @accounting_record
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @accounting_record
    assert_response :success
  end

  test "should update accounting_record" do
    patch :update, id: @accounting_record, accounting_record: { credit: @accounting_record.credit, debit: @accounting_record.debit, detail: @accounting_record.detail }
    assert_redirected_to accounting_record_path(assigns(:accounting_record))
  end

  test "should destroy accounting_record" do
    assert_difference('AccountingRecord.count', -1) do
      delete :destroy, id: @accounting_record
    end

    assert_redirected_to accounting_records_path
  end
end
