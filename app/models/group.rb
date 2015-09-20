class Group < ActiveRecord::Base
  # associations
  has_many :users, through: :group_users
  has_many :group_users
  has_many :expenses

  # validations
  validates :name, presence: true
  validates :description, presence: true

  def share_amount
  	total_amount = self.expenses.inject(0){|sum, expense| sum +=expense.amount }
  	(total_amount.to_f / self.users.count)
  end

  def paid_by_user(user)
  	expenses_paid_by_user = self.expenses.where(paid_by: user.id).inject(0){|sum, expense| sum += expense.amount }
  end

  def balanse(user)
    paid_by_user(user) - self.share_amount
  end
end
