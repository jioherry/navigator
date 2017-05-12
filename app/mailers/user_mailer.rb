class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.notify_comment.subject
  #
  default :from => "tradenavigator<jioherry@gmail.org>"

  def notify_issue(user, issue)
      @issue = issue
      mail(:to => user.email, :subject => "New issue")
  end

end
