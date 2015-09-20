class Expense < ActiveRecord::Base
  # association
  belongs_to :group
  belongs_to :user

  # validations
  validates :amount, presence: true
  validates :description, presence: true
  validates :paid_by, presence: true
end
