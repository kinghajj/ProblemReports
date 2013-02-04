require 'test_helper'

class ProblemReportEmailsControllerTest < ActionController::TestCase
  setup do
    @problem_report_email = problem_report_emails(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:problem_report_emails)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create problem_report_email" do
    assert_difference('ProblemReportEmail.count') do
      post :create, problem_report_email: @problem_report_email.attributes
    end

    assert_redirected_to problem_report_email_path(assigns(:problem_report_email))
  end

  test "should show problem_report_email" do
    get :show, id: @problem_report_email
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @problem_report_email
    assert_response :success
  end

  test "should update problem_report_email" do
    put :update, id: @problem_report_email, problem_report_email: @problem_report_email.attributes
    assert_redirected_to problem_report_email_path(assigns(:problem_report_email))
  end

  test "should destroy problem_report_email" do
    assert_difference('ProblemReportEmail.count', -1) do
      delete :destroy, id: @problem_report_email
    end

    assert_redirected_to problem_report_emails_path
  end
end
