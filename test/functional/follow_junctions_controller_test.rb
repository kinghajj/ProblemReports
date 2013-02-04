require 'test_helper'

class FollowJunctionsControllerTest < ActionController::TestCase
  setup do
    @follow_junction = follow_junctions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:follow_junctions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create follow_junction" do
    assert_difference('FollowJunction.count') do
      post :create, follow_junction: @follow_junction.attributes
    end

    assert_redirected_to follow_junction_path(assigns(:follow_junction))
  end

  test "should show follow_junction" do
    get :show, id: @follow_junction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @follow_junction
    assert_response :success
  end

  test "should update follow_junction" do
    put :update, id: @follow_junction, follow_junction: @follow_junction.attributes
    assert_redirected_to follow_junction_path(assigns(:follow_junction))
  end

  test "should destroy follow_junction" do
    assert_difference('FollowJunction.count', -1) do
      delete :destroy, id: @follow_junction
    end

    assert_redirected_to follow_junctions_path
  end
end
