require 'test_helper'

class SafkesControllerTest < ActionController::TestCase
  setup do
    @safke = safkes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:safkes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create safke" do
    assert_difference('Safke.count') do
      post :create, safke: { user_id: @safke.user_id }
    end

    assert_redirected_to safke_path(assigns(:safke))
  end

  test "should show safke" do
    get :show, id: @safke
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @safke
    assert_response :success
  end

  test "should update safke" do
    patch :update, id: @safke, safke: { user_id: @safke.user_id }
    assert_redirected_to safke_path(assigns(:safke))
  end

  test "should destroy safke" do
    assert_difference('Safke.count', -1) do
      delete :destroy, id: @safke
    end

    assert_redirected_to safkes_path
  end
end
