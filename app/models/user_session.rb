class UserSession < Authlogic::Session::Base
  before_validation_on_create :validate_user_account
  attr_accessor :account
  
  protected
  def validate_user_account
    user = User.username_equals(username).first
    unless user.nil? || account.nil? || account.id == 0
      errors.add(:base, user.username + " is not a user at " + account.name + ".app.local") unless user.accounts.include?(account)
    end
  end

end