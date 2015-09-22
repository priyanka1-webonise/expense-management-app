class AddInviteGroupIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :invite_group_id, :integer
  end
end
