class Role < ActiveRecord::Base
  has_many :registrations
  has_many :users, :through => :registrations
  belongs_to :user_type
end