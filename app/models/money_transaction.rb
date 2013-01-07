class MoneyTransaction < ActiveRecord::Base
  attr_accessible :amount, :comment, :from_id, :to_id
  
  belongs_to :from, :class_name => Account
  belongs_to :to, :class_name => Account

  validates_presence_of :amount, :from, :to
  validate :positiveness_of_amount, :money_availability

  before_create :transfer_money

  private

  def positiveness_of_amount
    errors.add(:amount, "should be a positive number") if amount <= 0.0
  end

  def money_availability
    errors.add(:amount, "you have not enough money") if amount > from.balance
  end

  def transfer_money
    transaction do
      from.update_attribute(:balance, from.balance - amount)
      to.update_attribute(:balance, to.balance + amount)
    end
  end

end
 