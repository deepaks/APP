class Plaintext < ActiveRecord::Base
  has_one :post_part, :as => :postable, :dependent => :destroy
  has_one :post, :through => :post_part
  belongs_to :account

  acts_as_textiled :body
	
	has_many :post_contents, :as => :content
  has_many :post_parts, :through => :post_contents
  
	include ActsAsPostable
  
end
