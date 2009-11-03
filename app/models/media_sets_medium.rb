class MediaSetsMedium < ActiveRecord::Base
  belongs_to :media_set
  belongs_to :picture
  belongs_to :video
  belongs_to :medium, :polymorphic => :true
end
