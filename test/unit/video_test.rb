require 'test_helper'

class VideoTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Video.new.valid?
  end
end
