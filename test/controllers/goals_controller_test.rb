require 'test_helper'

class GoalsControllerTest < ActionController::TestCase
  setup do
    @goal = goals(:one)
    @account = Account.first
  end

  test "should get index" do
    sign_in @account          # sign_in(resource)
    get :index
    assert_response :success
    assert_not_nil assigns(:goals)
  end

  test "should get new" do
    sign_in @account          # sign_in(resource)
    get :new
    assert_response :success
  end

  test "should create goal" do
    sign_in @account          # sign_in(resource)
    assert_difference('Goal.count') do
      post :create, goal: { actual_total: @goal.actual_total, desired_total: @goal.desired_total, duration: @goal.duration, frequency: @goal.frequency, name: @goal.name, start_date: @goal.start_date }
    end

    assert_redirected_to goal_path(assigns(:goal))
  end

  test "should show goal" do
    sign_in @account          # sign_in(resource)
    get :show, id: @goal
    assert_response :success
  end

  test "should get edit" do
    sign_in @account          # sign_in(resource)
    get :edit, id: @goal
    assert_response :success
  end

  test "should update goal" do
    sign_in @account          # sign_in(resource)
    patch :update, id: @goal, goal: { actual_total: @goal.actual_total, desired_total: @goal.desired_total, duration: @goal.duration, frequency: @goal.frequency, name: @goal.name, start_date: @goal.start_date }
    assert_redirected_to goal_path(assigns(:goal))
  end

  test "should destroy goal" do
    sign_in @account          # sign_in(resource)
    assert_difference('Goal.count', -1) do
      delete :destroy, id: @goal
    end

    assert_redirected_to goals_path
  end
end
