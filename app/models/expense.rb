class Expense < ActiveRecord::Base
  # association
  belongs_to :group

  # validations
  validates :amount, presence: true
end
