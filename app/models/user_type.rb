class UserType < ActiveRecord::Base
  has_many :roles
  has_many :users
  validates_uniqueness_of :user_type
end
