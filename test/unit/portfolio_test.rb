require 'test_helper'

class PortfolioTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Portfolio.new.valid?
  end
end
