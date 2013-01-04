class Account < ActiveRecord::Base
  
  attr_accessible :balance, :currency, :uid, :user_id
  
  CURRENCIES = {
    :eur => "EUR",
    :usd => "USD",
    :rur => "RUR",
    :bur => "BUR"
  }

  belongs_to :user
end
