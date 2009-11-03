class Video < ActiveRecord::Base
  has_one :post_part, :as => :postable
  has_one :post, :through => :post_part
  belongs_to :account
  belongs_to :post

  has_many :post_contents, :as => :content
  has_many :post_parts, :through => :post_contents
  
  has_many :media_sets_media, :as => :medium
  has_many :media_sets, :through => :media_sets_media
  
  include ActsAsPostable

end
