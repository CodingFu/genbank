class MoneyTransactionsController < ApplicationController
  # GET /money_transactions
  # GET /money_transactions.json
  def index
    @money_transactions = MoneyTransaction.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @money_transactions }
    end
  end

  # GET /money_transactions/1
  # GET /money_transactions/1.json
  def show
    @money_transaction = MoneyTransaction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @money_transaction }
    end
  end

  # GET /money_transactions/new
  # GET /money_transactions/new.json
  def new
    @money_transaction = MoneyTransaction.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @money_transaction }
    end
  end

  # GET /money_transactions/1/edit
  def edit
    @money_transaction = MoneyTransaction.find(params[:id])
  end

  # POST /money_transactions
  # POST /money_transactions.json
  def create
    @money_transaction = MoneyTransaction.new(params[:money_transaction])

    respond_to do |format|
      if @money_transaction.save
        format.html { redirect_to root_url, flash: { success: "Founds were successfully transfered to #{@money_transaction.to.formatted_uid}" } }
        format.json { render json: @money_transaction, status: :created, location: @money_transaction }
      else
        format.html { render action: "new" }
        format.json { render json: @money_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /money_transactions/1
  # PUT /money_transactions/1.json
  def update
    @money_transaction = MoneyTransaction.find(params[:id])

    respond_to do |format|
      if @money_transaction.update_attributes(params[:money_transaction])
        format.html { redirect_to @money_transaction, notice: 'Money transaction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @money_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /money_transactions/1
  # DELETE /money_transactions/1.json
  def destroy
    @money_transaction = MoneyTransaction.find(params[:id])
    @money_transaction.destroy

    respond_to do |format|
      format.html { redirect_to money_transactions_url }
      format.json { head :no_content }
    end
  end
end
