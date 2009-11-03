class Project < ActiveRecord::Base
  
  #has_and_belongs_to_many :portfolios
  belongs_to :account
  has_many :posts, :order => "updated_at DESC"
  has_one :address, :as => :addressable
  belongs_to :cover_picture, :class_name => "Picture", :foreign_key => "cover_picture_id"
  has_many :posts
  belongs_to :user
  has_many :project_taggings
  has_many :portfolio_images
  has_many :portfolios, :through => :portfolio_images
  
  named_scope :featured, :conditions => {:featured => true}
  
  accepts_nested_attributes_for :address, :allow_destroy => true
  acts_as_taggable

  def thumbnail
    posts.collect{|post| post.pictures}.flatten.first
  end
  
  def pictures
    posts.collect{|post| post.pictures}.flatten
  end
  
  def cover
    if self.cover_picture.nil?
      self.pictures.first
    else
      self.cover_picture
    end
  end

 # def make_address
 #   @address = Address.new(:addressable_type => self.type.name, :addressable_id => self.id) 
 #   @address.save!
 # end

end
