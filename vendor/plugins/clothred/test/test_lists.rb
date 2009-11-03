# test_lists.rb
# 17. April 2007
#

$:.unshift File.join(File.dirname(__FILE__),'..','lib')

begin
  require "rubygems"
  require "clothred"
rescue LoadError
  require "clothred"
end

require 'test/unit'

class TestClothRedLists < Test::Unit::TestCase
 
LISTS_TEST = [
    ["<ol>",""], ["</ol>",""], ["<li>","*"], ["</li>",""]
  ]
  
  def test_lists
    LISTS_TEST.each do |html, textile|
      test_html = ClothRed.new(html)
      result = test_html.to_textile
      assert_equal(textile,result)
    end
  end
end