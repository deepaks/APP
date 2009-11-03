class PostContent < ActiveRecord::Base
  belongs_to :post_part
  belongs_to :picture
  belongs_to :video
  belongs_to :content, :polymorphic => :true
end
