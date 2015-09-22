class GroupsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :group, only: [:details, :add_member, :invite]

  def new
    @group = Group.new
    @user_list = User.all.select("id, email").reject{|e| e.id == current_user.id}.to_json
  end

  def create
    grp = Group.new(name: params[:name], description: params[:description])
    if grp.save
      grp.group_users.create(user_id: current_user.id, is_admin: true)
      params[:email].each do |user_id|
        grp.group_users.create(user_id: user_id )
      end
      redirect_to groups_path
    else
      render 'new'
    end
  end

  def index
    @groups = current_user.groups
  end

  def details
    @expenses = @group.expenses
    @all_members = @group.users
  end

  def add_member
    members = @group.users.pluck(:id)
    @user_list = User.all.select("id, email").reject{|e| members.include?(e.id)}.to_json
  end

  def create_member
    params[:email].each do |email|
      group.group_users.create(user_id: email.to_i)
    end
    redirect_to request.referer
  end

  def invite

  end

  private
  def group
    @group = Group.find(params[:id] || params[:group_id])
  end
end
