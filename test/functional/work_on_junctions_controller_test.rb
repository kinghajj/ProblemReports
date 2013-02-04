require 'test_helper'

class WorkOnJunctionsControllerTest < ActionController::TestCase
  setup do
    @work_on_junction = work_on_junctions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:work_on_junctions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create work_on_junction" do
    assert_difference('WorkOnJunction.count') do
      post :create, work_on_junction: @work_on_junction.attributes
    end

    assert_redirected_to work_on_junction_path(assigns(:work_on_junction))
  end

  test "should show work_on_junction" do
    get :show, id: @work_on_junction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @work_on_junction
    assert_response :success
  end

  test "should update work_on_junction" do
    put :update, id: @work_on_junction, work_on_junction: @work_on_junction.attributes
    assert_redirected_to work_on_junction_path(assigns(:work_on_junction))
  end

  test "should destroy work_on_junction" do
    assert_difference('WorkOnJunction.count', -1) do
      delete :destroy, id: @work_on_junction
    end

    assert_redirected_to work_on_junctions_path
  end
end
