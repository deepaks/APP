class PortfolioImage < ActiveRecord::Base
  belongs_to :project
  belongs_to :portfolio
end
