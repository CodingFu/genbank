class MoneyTransaction < ActiveRecord::Base
  attr_accessor :to_uid
  attr_accessible :amount, :comment, :from_id, :to_uid
  
  belongs_to :from, :class_name => Account
  belongs_to :to, :class_name => Account

  before_validation(:on => :create) do
    self.to = Account.find_by_uid(to_uid.gsub(/[^0-9]/, ""))
    
    if self.to.present? && self.to.is_vendor
      rx = Regexp.new self.to.validation
      errors.add(:comment, self.to.comment_hint) unless rx.match(self.comment)
    end
  
  end

  validates_presence_of :from_id
  validates_numericality_of :amount
  validates :to_uid, :format => { :with => /^[0-9\-\ ]+$/, :message => "Wrong format. Only digits, dashes and spaces are allowed"}
  validate :positiveness_of_amount, :money_availability,
    :currency_equality, :existence_of_to

  validates_presence_of :comment, :if => lambda { self.to && self.to.is_vendor }

  before_create :transfer_money

  private

  # validations

  def existence_of_to
    errors.add(:to_uid, "account doesn't exist") unless self.to
  end

  def positiveness_of_amount
    errors.add(:amount, "should be a positive number") if amount.present? and amount <= 0.0
  end

  def money_availability
    errors.add(:amount, "you have not enough money") if amount.present? and from.present? and amount > from.balance
  end

  def currency_equality
    if from.present? && to.present?
      errors.add(:to_uid, "account is in another currency") if from.currency != to.currency
    end
  end

  def transfer_money
    if to.id != from.id
      transaction do
        from.update_attribute(:balance, from.balance - amount)
        to.update_attribute(:balance, to.balance + amount)
      end
    end
  end

end
 