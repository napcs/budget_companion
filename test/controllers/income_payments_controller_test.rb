require 'test_helper'

class IncomePaymentsControllerTest < ActionController::TestCase
  setup do
    @income = incomes(:one)
    @income_payment = income_payments(:one)
    @income_payment.income = @income
    @account = Account.first
  end

  test "should get index" do
    sign_in @account          # sign_in(resource)
    get :index, income_id: @income.id
    assert_response :success
    assert_not_nil assigns(:income_payments)
  end

  test "should get new" do
    sign_in @account          # sign_in(resource)
    get :new, income_id: @income.id
    assert_response :success
  end

  test "should create income_payment" do
    sign_in @account          # sign_in(resource)
    assert_difference('IncomePayment.count') do
      post :create, income_id: @income.id, income_payment: { gross_income: @income_payment.gross_income, net_income: @income_payment.net_income, payment_date: @income_payment.payment_date, received: @income_payment.received }
    end

    assert_redirected_to income_income_payments_path(@income)
  end

  test "should show income_payment" do
    sign_in @account          # sign_in(resource)
    get :show, income_id: @income.id, id: @income_payment
    assert_response :success
  end

  test "should get edit" do
    sign_in @account          # sign_in(resource)
    get :edit, income_id: @income.id, id: @income_payment
    assert_response :success
  end

  test "should update income_payment" do
    sign_in @account          # sign_in(resource)
    patch :update, income_id: @income.id, id: @income_payment, income_payment: { gross_income: @income_payment.gross_income, net_income: @income_payment.net_income, payment_date: @income_payment.payment_date, received: @income_payment.received }
    assert_redirected_to income_income_payments_path(@income)
  end

  test "should destroy income_payment" do
    sign_in @account          # sign_in(resource)
    assert_difference('IncomePayment.count', -1) do
      delete :destroy, income_id: @income.id, id: @income_payment
    end

    assert_redirected_to income_income_payments_path(@income)
  end
end
