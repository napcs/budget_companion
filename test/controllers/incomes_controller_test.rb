require 'test_helper'

class IncomesControllerTest < ActionController::TestCase
  setup do
    @income = incomes(:one)
    @account = Account.first
  end

  test "should get index" do
    sign_in @account          # sign_in(resource)
    get :index
    assert_response :success
    assert_not_nil assigns(:incomes)
  end

  test "should get new" do
    sign_in @account          # sign_in(resource)
    get :new
    assert_response :success
  end

  test "should create income" do
    sign_in @account          # sign_in(resource)
    assert_difference('Income.count') do
      post :create, income: { bank_account: @income.bank_account, category: @income.category, gross_income: @income.gross_income, income_source: @income.income_source, net_income: @income.net_income }
    end

    assert_redirected_to income_path(assigns(:income))
  end

  test "should show income" do
    sign_in @account          # sign_in(resource)
    get :show, id: @income
    assert_response :success
  end

  test "should get edit" do
    sign_in @account          # sign_in(resource)
    get :edit, id: @income
    assert_response :success
  end

  test "should update income" do
    sign_in @account          # sign_in(resource)
    patch :update, id: @income, income: { bank_account: @income.bank_account, category: @income.category, gross_income: @income.gross_income, income_source: @income.income_source, net_income: @income.net_income }
    assert_redirected_to income_path(assigns(:income))
  end

  test "should destroy income" do
    sign_in @account          # sign_in(resource)
    assert_difference('Income.count', -1) do
      delete :destroy, id: @income
    end

    assert_redirected_to incomes_path
  end
end
