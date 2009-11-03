class Post < ActiveRecord::Base
  belongs_to :account
  belongs_to :project
  has_many :post_parts, :order => :position, :dependent => :destroy
  has_many :post_links
  has_many :pictures
  has_many :videos
  belongs_to :post
  belongs_to :project

  validates_presence_of :title
  
  acts_as_taggable
  
  before_save :set_account
  before_save :dump_empty_parts
  
  def contents
    self.post_parts.collect{|post_part| post_part.content}.flatten.compact
  end
  
  def texts
    self.contents.select{|content| content.instance_of?(Plaintext)}
  end
  
  def pictures
    self.contents.select{|content| content.instance_of?(Picture)}
  end

  def content_ids
    self.contents.map{|c|c.id}
  end
  
  def videos
    self.contents.select{|content| content.instance_of?(Video)}
  end
  
  def set_account
    if self.project && self.project.account && self.account.nil?
      self.account = self.project.account
    end
  end
  
  def dump_empty_parts
    self.post_parts.each do |part|
      if part.content.nil?
        part.destroy
      end
    end
  end
  
end
