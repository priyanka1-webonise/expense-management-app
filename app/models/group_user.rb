class GroupUser < ActiveRecord::Base
  # associations
  belongs_to :group
  belongs_to :user
end
