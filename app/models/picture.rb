require 'mime/types'

class Picture < ActiveRecord::Base
  has_one :post_part, :as => :postable
  has_one :post, :through => :post_part
  belongs_to :account
  belongs_to :post
  has_one :profile_info
  belongs_to :user
  belongs_to :project
  
  include ActsAsPostable

  has_many :post_contents, :as => :content
  has_many :post_parts, :through => :post_contents

  has_many :media_sets_media, :as => :medium
  has_many :media_sets, :through => :media_sets_media

  has_attached_file :image, 
  :url => "/domains/:class/:attachment/:id/:style_:basename.:extension",
  :styles => {
    :thumb => "80x80#",
    :large_thumb => "200x150#",
    :small => "160x106#",
    :medium => "320x212>",
    :large => "750x497>"
  }
  
  attr_protected :image_file_name, :image_content_type, :image_size
  
  validates_attachment_presence :image

  def swfupload_file=(data)
    data.content_type = MIME::Types.type_for(data.original_filename).to_s
    self.image = data
  end
  
  def reference_count
    post_parts.size
  end
  
  def caption
    if self.name.nil?
      ""
    else
      self.name
    end
  end

end