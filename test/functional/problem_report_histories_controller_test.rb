require 'test_helper'

class ProblemReportHistoriesControllerTest < ActionController::TestCase
  setup do
    @problem_report_history = problem_report_histories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:problem_report_histories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create problem_report_history" do
    assert_difference('ProblemReportHistory.count') do
      post :create, problem_report_history: @problem_report_history.attributes
    end

    assert_redirected_to problem_report_history_path(assigns(:problem_report_history))
  end

  test "should show problem_report_history" do
    get :show, id: @problem_report_history
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @problem_report_history
    assert_response :success
  end

  test "should update problem_report_history" do
    put :update, id: @problem_report_history, problem_report_history: @problem_report_history.attributes
    assert_redirected_to problem_report_history_path(assigns(:problem_report_history))
  end

  test "should destroy problem_report_history" do
    assert_difference('ProblemReportHistory.count', -1) do
      delete :destroy, id: @problem_report_history
    end

    assert_redirected_to problem_report_histories_path
  end
end
