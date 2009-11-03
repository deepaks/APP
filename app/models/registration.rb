class Registration < ActiveRecord::Base
  belongs_to :account
  belongs_to :user
  belongs_to :role
  
  after_create :set_default_role
  
  protected
  
  def set_default_role
    self.role = Role.name_equals('account_member').first if self.role.nil?
  end
  
end
