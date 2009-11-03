class ServicePlan < ActiveRecord::Base
  belongs_to :account
  has_one :order
end
