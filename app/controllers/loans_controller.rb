class LoansController < ApplicationController
  before_action :set_loan, only: %i[ show update destroy ]

  # GET /loans
  def index
    @loans = Loan.all

    render json: @loans
  end

  # GET /loans/1
  def show
    render json: @loan
  end

  # POST /loans
  def create
    @loan = Loan.new(loan_params)

    if @loan.save
      render json: @loan, status: :created, location: @loan
    else
      render json: @loan.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /loans/1
  def update
    if @loan.update(status: 0, returned_at: Time.now)
      render json: @loan
    else
      render json: @loan.errors, status: :unprocessable_content
    end
  end

  # DELETE /loans/1
  def destroy
    @loan.destroy!
  end

  # ONTIME /loans/ontime
  def ontime
    @loans = Loan.where("return_deadline > returned_at")

    render json: @loans
  end

  # LATE /loans/late
  def late
    @loans = Loan.where("return_deadline <= returned_at")

    render json: @loans
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan
      @loan = Loan.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def loan_params
      params.expect(loan: [ :book_id, :borrower_id, :return_deadline, :borrowed_at, :returned_at ])
    end
end
