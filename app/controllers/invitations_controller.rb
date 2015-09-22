class InvitationsController < Devise::InvitationsController

  def create
    @from    = current_user.email
    @subject = params[:invite_subject]
    @content = params[:invite_content]
    @user = User.invite!({email: params[:user_email]}, current_user)
    @user.update_attribute("invite_group_id",params[:invite_group_id])
    @user.update_attribute("name",params[:user_name])
    if @user.errors.empty?
      flash[:notice] = "successfully sent invite to #{@user.email}"
      respond_with @user, :location => root_path
    else
      render :new
    end
  end
end
