class Portfolio < ActiveRecord::Base
  belongs_to :account
  #has_and_belongs_to_many :projects
  has_many :portfolio_images
  has_many :projects, :through => :portfolio_images
  belongs_to :user
  
  acts_as_taggable
  
  def posts
    projects.collect{|proj| proj.posts}.flatten.sort{|m,n| n.updated_at <=> m.updated_at}
  end
  
  def thumbnail
    posts.collect{|post| post.pictures}.flatten.first
  end
  
  
end
