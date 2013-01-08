class MoneyTransactionsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :validate_from_id, :only => :create

  def index
    @money_transactions = current_user.money_transactions.limit(30)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @money_transactions }
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

  private

  def validate_from_id
    if params[:money_transaction][:from_id].present? && !current_user.account_ids.include?(params[:money_transaction][:from_id].to_i)
      render :text => "Go away!"
    end
  end
end
