class PortfoliosProjects < ActiveRecord::Base
  belongs_to :portfolio
  belongs_to :project
end
