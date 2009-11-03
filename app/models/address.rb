class Address < ActiveRecord::Base
  belongs_to :addressable, :polymorphic => true
  #has_one :project
end
