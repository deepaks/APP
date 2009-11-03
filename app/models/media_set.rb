class MediaSet < ActiveRecord::Base
  belongs_to :account
  has_many :media_sets_media
  has_many :pictures, :through => :media_sets_media
  has_many :videos, :through => :media_sets_media
  def media
    media_sets_media.collect{|m| m.medium}.flatten
  end
end
