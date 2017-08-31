class Expense < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :users

  monetize :amount_cents, :as => "amount"

  def payer
    self.user
  end

  def beneficiaries
    self.users
  end
end
