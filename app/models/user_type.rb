class UserType < ActiveRecord::Base
  has_many :roles

  validates_uniqueness_of :user_type
end
