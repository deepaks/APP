class Tag < ActiveRecord::Base
  has_one :post
end
