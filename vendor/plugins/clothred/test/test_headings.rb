# test_headings.rb
# 12. April 2007
#

$:.unshift File.join(File.dirname(__FILE__),'..','lib')

begin
  require "rubygems"
  require "clothred"
rescue LoadError
  require "clothred"
end

require 'test/unit'

class TestClothRedHeadings < Test::Unit::TestCase

  HEADING_TEST = [
  ["<h1>Heading 1</h1>","h1. Heading 1\n\n"], ["<h2>Heading 2</h2>", "h2. Heading 2\n\n"],
  ["<h3>Heading 3", "h3. Heading 3\n\n"], ["<h4>Heading 4</h4>", "h4. Heading 4\n\n"],
  ["<h5>Heading 5", "h5. Heading 5\n\n"], ["<h6>Heading 6</h6>", "h6. Heading 6\n\n"]
  ]


  def test_headings
    HEADING_TEST.each do |html, textile|
      test_html = ClothRed.new(html)
      result = test_html.to_textile
      assert_equal(textile,result)
    end
  end

  MIST_TEST = [
  ["<h1>Heading 1</h1><h2>Heading 2</h2>","h1. Heading 1\n\nh2. Heading 2\n\n"],
  ]


  def test_headings
    MIST_TEST.each do |html, textile|
      test_html = ClothRed.new(html)
      result = test_html.to_textile
      assert_equal(textile,result)
    end
  end

end
