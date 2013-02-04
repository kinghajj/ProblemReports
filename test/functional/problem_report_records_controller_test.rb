require 'test_helper'

class ProblemReportRecordsControllerTest < ActionController::TestCase
  setup do
    @problem_report_record = problem_report_records(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:problem_report_records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create problem_report_record" do
    assert_difference('ProblemReportRecord.count') do
      post :create, problem_report_record: @problem_report_record.attributes
    end

    assert_redirected_to problem_report_record_path(assigns(:problem_report_record))
  end

  test "should show problem_report_record" do
    get :show, id: @problem_report_record
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @problem_report_record
    assert_response :success
  end

  test "should update problem_report_record" do
    put :update, id: @problem_report_record, problem_report_record: @problem_report_record.attributes
    assert_redirected_to problem_report_record_path(assigns(:problem_report_record))
  end

  test "should destroy problem_report_record" do
    assert_difference('ProblemReportRecord.count', -1) do
      delete :destroy, id: @problem_report_record
    end

    assert_redirected_to problem_report_records_path
  end
end
