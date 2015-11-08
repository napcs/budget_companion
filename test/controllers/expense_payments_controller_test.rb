require 'test_helper'

class ExpensePaymentsControllerTest < ActionController::TestCase
  setup do
    @expense_payment = expense_payments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:expense_payments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create expense_payment" do
    assert_difference('ExpensePayment.count') do
      post :create, expense_payment: { amount: @expense_payment.amount, due_date: @expense_payment.due_date, paid: @expense_payment.paid, payment_date: @expense_payment.payment_date }
    end

    assert_redirected_to expense_payment_path(assigns(:expense_payment))
  end

  test "should show expense_payment" do
    get :show, id: @expense_payment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @expense_payment
    assert_response :success
  end

  test "should update expense_payment" do
    patch :update, id: @expense_payment, expense_payment: { amount: @expense_payment.amount, due_date: @expense_payment.due_date, paid: @expense_payment.paid, payment_date: @expense_payment.payment_date }
    assert_redirected_to expense_payment_path(assigns(:expense_payment))
  end

  test "should destroy expense_payment" do
    assert_difference('ExpensePayment.count', -1) do
      delete :destroy, id: @expense_payment
    end

    assert_redirected_to expense_payments_path
  end
end
