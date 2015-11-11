require 'test_helper'

class ExpensePaymentsControllerTest < ActionController::TestCase
  setup do
    @expense = expenses(:one)
    @expense_payment = expense_payments(:one)
    @expense_payment.expense = @expense
    @expense_payment.save!
    @account = Account.first
  end

  test "should get index" do
    sign_in @account          # sign_in(resource)
    get :index, expense_id: @expense.id
    assert_response :success
    assert_not_nil assigns(:expense_payments)
  end

  test "should get new" do
    sign_in @account          # sign_in(resource)
    get :new, expense_id: @expense.id
    assert_response :success
  end

  test "should create expense_payment" do
    sign_in @account          # sign_in(resource)
    assert_difference('ExpensePayment.count') do
      post :create, expense_id: @expense.id, expense_payment: { amount: @expense_payment.amount, due_date: @expense_payment.due_date, paid: @expense_payment.paid, payment_date: @expense_payment.payment_date }
    end

    assert_redirected_to expense_expense_payments_path(@expense)
  end

  test "should show expense_payment" do
    sign_in @account          # sign_in(resource)
    get :show, expense_id: @expense, id: @expense_payment
    assert_response :success
  end

  test "should get edit" do
    sign_in @account          # sign_in(resource)
    get :edit, expense_id: @expense, id: @expense_payment
    assert_response :success
  end

  test "should update expense_payment" do
    sign_in @account          # sign_in(resource)
    patch :update, expense_id: @expense, id: @expense_payment, expense_payment: { amount: @expense_payment.amount, due_date: @expense_payment.due_date, paid: @expense_payment.paid, payment_date: @expense_payment.payment_date }
    assert_redirected_to expense_expense_payments_path(@expense)
  end

  test "should destroy expense_payment" do
    sign_in @account          # sign_in(resource)
    assert_difference('ExpensePayment.count', -1) do
      delete :destroy, expense_id: @expense, id: @expense_payment
    end

    assert_redirected_to expense_expense_payments_path(@expense)
  end
end
