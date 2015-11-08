class ExpensePaymentsController < ApplicationController
  before_action :authenticate_account!
  before_action :set_expense
  before_action :set_expense_payment, only: [:show, :edit, :update, :destroy]

  # GET /expense_payments
  # GET /expense_payments.json
  def index
    @expense_payments = @expense.expense_payments.all
  end

  # GET /expense_payments/1
  # GET /expense_payments/1.json
  def show
  end

  # GET /expense_payments/new
  def new
    @expense_payment = @expense.expense_payments.build
    @expense_payment.amount = @expense.amount
    @expense_payment.due_date = 1.month.from_now
  end

  # GET /expense_payments/1/edit
  def edit
  end

  # POST /expense_payments
  # POST /expense_payments.json
  def create
    @expense_payment = @expense.expense_payments.build(expense_payment_params)

    respond_to do |format|
      if @expense_payment.save
        format.html { redirect_to expense_expense_payments_path(@expense), notice: 'Expense payment was successfully created.' }
        format.json { render :show, status: :created, location: @expense_payment }
      else
        format.html { render :new }
        format.json { render json: @expense_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expense_payments/1
  # PATCH/PUT /expense_payments/1.json
  def update
    respond_to do |format|
      if @expense_payment.update(expense_payment_params)
        format.html { redirect_to expense_expense_payments_path(@expense), notice: 'Expense payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @expense_payment }
      else
        format.html { render :edit }
        format.json { render json: @expense_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expense_payments/1
  # DELETE /expense_payments/1.json
  def destroy
    @expense_payment.destroy
    respond_to do |format|
      format.html { redirect_to expense_expense_payments_path(@expense), notice: 'Expense payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense_payment
      @expense_payment = @expense.expense_payments.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expense_payment_params
      params.require(:expense_payment).permit(:amount, :due_date, :payment_date, :paid)
    end

    def set_expense
      @expense = current_account.expenses.find(params[:expense_id])
    end
end
