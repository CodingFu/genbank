class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  has_many :accounts


  def name
    self.email
  end
  
  def money_transactions
    ids = self.accounts.map(&:id)
    MoneyTransaction
      .where("to_id IN (?) OR from_id IN (?)", ids, ids)
      .order("created_at DESC")
  end

end
