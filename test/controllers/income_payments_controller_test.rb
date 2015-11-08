require 'test_helper'

class IncomePaymentsControllerTest < ActionController::TestCase
  setup do
    @income_payment = income_payments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:income_payments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create income_payment" do
    assert_difference('IncomePayment.count') do
      post :create, income_payment: { gross_income: @income_payment.gross_income, net_income: @income_payment.net_income, paymentDate: @income_payment.paymentDate }
    end

    assert_redirected_to income_payment_path(assigns(:income_payment))
  end

  test "should show income_payment" do
    get :show, id: @income_payment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @income_payment
    assert_response :success
  end

  test "should update income_payment" do
    patch :update, id: @income_payment, income_payment: { gross_income: @income_payment.gross_income, net_income: @income_payment.net_income, paymentDate: @income_payment.paymentDate }
    assert_redirected_to income_payment_path(assigns(:income_payment))
  end

  test "should destroy income_payment" do
    assert_difference('IncomePayment.count', -1) do
      delete :destroy, id: @income_payment
    end

    assert_redirected_to income_payments_path
  end
end
