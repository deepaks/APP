class User < ActiveRecord::Base  
  acts_as_authentic
  belongs_to :user_type
  has_many :registrations
  has_many :accounts, :through => :registrations
  has_many :roles, :through => :registrations
  has_many :pictures
  has_many :projects
  has_many :portfolios
  has_many :persistent_documents
  has_one :profile_info
  has_many :key_members
  has_many :favourites

#  validates_presence_of :email
#  validates_presence_of :password
#  validates_uniqueness_of :email
  
  def deliver_password_reset_instructions!(account_subdomain)
    reset_perishable_token!  
    Notifier.deliver_password_reset_instructions(self, account_subdomain)
  end
  
  # ---------------------------------------
  # The following code has been generated by role_requirement.
  # You may wish to modify it to suit your need
  # has_role? simply needs to return true or false whether a user has a role or not.  
  # It may be a good idea to have "admin" roles return true always
  def has_role?(role_in_question)
    @_list ||= self.roles.collect(&:name)
    return true if @_list.include?("sys_admin")
    (@_list.include?(role_in_question.to_s) )
  end
  
  def belongs_to_account?(account_id)
    @_list ||= self.registrations.collect(&:account_id)
    ! @_list.empty?
  end
  
  
  
  # ---------------------------------------
  

	#   #------------------------
	#   # Twitter integration
	#   #------------------------
	# 
	#   # Returns true or false depending on whether the user has authorized their Twitter account
	#   def twitter?
	#     (!twitter_token.blank? && !twitter_secret.blank? && (post_to_twitter == true)) ? true : false  
	#   end
	#   
	#   def got_twitter_info?
	#    (!twitter_token.blank? && !twitter_secret.blank?) ? true : false
	#   	
	# end
	#   
	#   # Updates a user's twitter with the given status
	#   def tweet(status)
	#     self.client.update(status)
	#   end
	# 
	#   def oauth
	#     Twitter::OAuth.new(TWITTER_KEY, TWITTER_SECRET)
	#   end
	# 
	#   def client
	#     x = self.oauth
	#     x.authorize_from_access(self.twitter_token, self.twitter_secret)
	#     Twitter::Base.new(x)
	#   end
	#   
	#   def remove_twitter_info
	#     self.twitter_token   = nil
	#     self.twitter_secret  = nil
	#     self.post_to_twitter = false
	#     self.save!
	#   end
	#   
	#   # END TWITTER INTEGRATION


end
