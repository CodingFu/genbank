class Account < ActiveRecord::Base
  
  attr_accessible :balance, :currency, :uid, :user_id
  
  CURRENCIES = {
    :eur => "EUR",
    :usd => "USD",
    :rur => "RUR",
    :bur => "BUR"
  }

  belongs_to :user

  validates_presence_of :currency, :uid, :user
  validates_uniqueness_of :uid

  def formatted_uid
    formatted = ""
    uid.split('').each_with_index do |n, ix|
      formatted += ' ' if ix % 4 == 0
      formatted += n
    end

    formatted
  end

  def name
    "#{formatted_uid} (#{currency})" 
  end

end
