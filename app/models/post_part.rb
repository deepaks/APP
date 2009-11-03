class PostPart < ActiveRecord::Base
  acts_as_list :scope => :post
  belongs_to :post
  # belongs_to :postable, :polymorphic => :true
  has_many :post_contents, :dependent => :destroy
  has_many :pictures, :through => :post_contents  
  has_many :videos, :through => :post_contents
  #has_one :post_content, :dependent => :destroy

  def content
    self.post_content.content
  end

end
