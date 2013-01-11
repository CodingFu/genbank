class PayForController < ApplicationController
  
  before_filter :get_account, :only => :pay
  before_filter :check, :only => :pay

  def pay
    @money_transaction = MoneyTransaction.new(:to_uid => @account.uid)
  end

  def transfer
    @money_transaction ||= MoneyTransaction.new(params[:money_transaction])

    respond_to do |format|
      if @money_transaction.save
        format.html { redirect_to root_path, flash: { success: "Founds were successfully transfered to #{@money_transaction.to.alias}" } }
        format.json { render json: @money_transaction, status: :created, location: @money_transaction }
      else
        @account ||= @money_transaction.to
        format.html { render action: "pay" }
        format.json { render json: @money_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def get_account
    @account ||= Account.find(params[:id])
  end

  def check
    render :text => "stop hacking the system!" if @account && !@account.is_vendor
    if !current_user.accounts.map(&:currency).include?(@account.currency)
      redirect_to root_url, :flash => {:error => "You should have an account in #{@account.currency} to pay for this service."}
    end
  end
end