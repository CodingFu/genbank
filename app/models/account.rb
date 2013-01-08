class Account < ActiveRecord::Base
  
  attr_accessible :balance, :currency, :uid, :user_id
  
  CURRENCIES = {
    :eur => "EUR",
    :usd => "USD",
    :rur => "RUR",
    :bur => "BUR"
  }

  belongs_to :user

  before_validation(:on => :create) do
    uid1 = ""
    i = Account.all.map(&:id).max || 0
    begin
      i += 1
      uid1 = i.to_s
      len = uid1.length
      uid1 = ("0" * (16 - len)) + uid1
    end while Account.find_by_uid(uid1).present?
    self.uid = uid1
  end

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

  def self.currencies
    CURRENCIES.values
  end

end
