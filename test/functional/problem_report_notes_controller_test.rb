require 'test_helper'

class ProblemReportNotesControllerTest < ActionController::TestCase
  setup do
    @problem_report_note = problem_report_notes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:problem_report_notes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create problem_report_note" do
    assert_difference('ProblemReportNote.count') do
      post :create, problem_report_note: @problem_report_note.attributes
    end

    assert_redirected_to problem_report_note_path(assigns(:problem_report_note))
  end

  test "should show problem_report_note" do
    get :show, id: @problem_report_note
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @problem_report_note
    assert_response :success
  end

  test "should update problem_report_note" do
    put :update, id: @problem_report_note, problem_report_note: @problem_report_note.attributes
    assert_redirected_to problem_report_note_path(assigns(:problem_report_note))
  end

  test "should destroy problem_report_note" do
    assert_difference('ProblemReportNote.count', -1) do
      delete :destroy, id: @problem_report_note
    end

    assert_redirected_to problem_report_notes_path
  end
end
