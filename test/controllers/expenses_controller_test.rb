require 'test_helper'

class ExpensesControllerTest < ActionController::TestCase
  setup do
    @expense = expenses(:one)
    @account = Account.first
  end

  test "should get index" do
    sign_in @account          # sign_in(resource)
    get :index
    assert_response :success
    assert_not_nil assigns(:expenses)
  end

  test "should get new" do
    sign_in @account          # sign_in(resource)
    get :new
    assert_response :success
  end

  test "should create expense" do
    sign_in @account          # sign_in(resource)
    assert_difference('Expense.count') do
      post :create, expense: { amount: @expense.amount, apr: @expense.apr, category: @expense.category, due_date: @expense.due_date, late_fee: @expense.late_fee, name: @expense.name, paid: @expense.paid, payment_date: @expense.payment_date }
    end

    assert_redirected_to expense_path(assigns(:expense))
  end

  test "should show expense" do
    sign_in @account          # sign_in(resource)
    get :show, id: @expense
    assert_response :success
  end

  test "should get edit" do
    sign_in @account          # sign_in(resource)
    get :edit, id: @expense
    assert_response :success
  end

  test "should update expense" do
    sign_in @account          # sign_in(resource)
    patch :update, id: @expense, expense: { amount: @expense.amount, apr: @expense.apr, category: @expense.category, due_date: @expense.due_date, late_fee: @expense.late_fee, name: @expense.name, paid: @expense.paid, payment_date: @expense.payment_date }
    assert_redirected_to expense_path(assigns(:expense))
  end

  test "should destroy expense" do
    sign_in @account          # sign_in(resource)
    assert_difference('Expense.count', -1) do
      delete :destroy, id: @expense
    end

    assert_redirected_to expenses_path
  end
end
