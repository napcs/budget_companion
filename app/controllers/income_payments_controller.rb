class IncomePaymentsController < ApplicationController
  before_action :authenticate_account!
  before_action :set_income
  before_action :set_income_payment, only: [:show, :edit, :update, :destroy]


  # GET /income_payments
  # GET /income_payments.json
  def index
    @income_payments = @income.income_payments.all
  end

  # GET /income_payments/1
  # GET /income_payments/1.json
  def show
  end

  # GET /income_payments/new
  def new
    @income_payment = @income.income_payments.build
    @income_payment.payment_date = 1.month.from_now
  end

  # GET /income_payments/1/edit
  def edit
  end

  # POST /income_payments
  # POST /income_payments.json
  def create
    @income_payment = @income.income_payments.build(income_payment_params)

    respond_to do |format|
      if @income_payment.save
        format.html { redirect_to income_income_payments_path(@income), notice: 'Income payment was successfully updated.' }
        format.json { render :show, status: :created, location: @income_payment }
      else
        format.html { render :new }
        format.json { render json: @income_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /income_payments/1
  # PATCH/PUT /income_payments/1.json
  def update
    respond_to do |format|
      if @income_payment.update(income_payment_params)
        format.html { redirect_to income_income_payments_path(@income), notice: 'Income payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @income_payment }
      else
        format.html { render :edit }
        format.json { render json: @income_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /income_payments/1
  # DELETE /income_payments/1.json
  def destroy
    @income_payment.destroy
    respond_to do |format|
      format.html { redirect_to income_income_payments_url(@income), notice: 'Income payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_income_payment
      @income_payment = @income.income_payments.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def income_payment_params
      params.require(:income_payment).permit(:gross_income, :net_income, :payment_date, :received)
    end

    def set_income
      @income = current_account.incomes.find(params[:income_id])
    end
end
