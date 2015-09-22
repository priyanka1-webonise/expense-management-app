class User < ActiveRecord::Base
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # associations
  has_many :groups, through: :group_users
  has_many :group_users
  has_many :expenses

  # validations
  validates :name, presence: true

  after_invitation_accepted :email_invited_by

  def email_invited_by
    group = Group.find_by_id(self.invite_group_id)
    if group.present?
      group.group_users.create(user_id: self.id )
    end
  end

  def my_share_details(group, contibuter)
  	contributer_expense = group.paid_by_user(contibuter)/ group.users.count
  	my_expense = group.paid_by_user(self).to_f / group.users.count
  	(my_expense - contributer_expense).round
  end 
end
