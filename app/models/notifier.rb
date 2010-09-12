class Notifier < ActionMailer::Base
  
  def password_reset(user)
    @subject = 'Split Schedule Password Reset Instructions'
    @recipients = user.email
    @from = 'password@splitschedule.com'
    @sent_on = Time.now
    @body = 'Hi, '
  end

end
