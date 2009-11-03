class Notifier < ActionMailer::Base
  default_url_options[:host] = "APP.local:3000"

  def password_reset_instructions(user, account_subdomain)
    subject       "Password Reset Instructions"
    from          "APP Notifier <notifier@#{account_subdomain}.APP.local>"
    recipients    user.email
    sent_on       Time.now
    body          :edit_password_reset_url => url_for(:controller => "password_resets",:action =>"edit",:id => user.perishable_token)#edit_password_reset_url
  end
end