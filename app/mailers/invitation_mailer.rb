class InvitationMailer < ApplicationMailer
  default from: "from@example.com"
  layout 'mailer'

  def invite_message(user, from, subject, content)
    @user = user
    @token = user.raw_invitation_token
    invitation_link = accept_user_invitation_url(:invitation_token => @token)
    content = "test"
    mail(:from => from, :bcc => from, :to => @user.email, :subject => subject) do |format|
      content = content.gsub('{{invitation_link}}', invitation_link)
      format.text do
        render :text => content
      end
    end
  end
end
