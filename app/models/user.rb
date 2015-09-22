class User < ActiveRecord::Base
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # associations
  has_many :groups, through: :group_users
  has_many :group_users
  has_many :expenses

  # validations
  validates :name, presence: true

  def my_share_details(group, contibuter)
  	contributer_expense = group.paid_by_user(contibuter)/ group.users.count
  	my_expense = group.paid_by_user(self).to_f / group.users.count
  	(my_expense - contributer_expense).round
  end 
end
