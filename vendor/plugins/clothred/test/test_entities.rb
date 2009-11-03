# test_entities.rb
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

class TestClothRedEntities < Test::Unit::TestCase
 
  ENTITIES_TEST = [
    ["&#8220;", '"'], ["&#8221;", '"'], ["&#8212;", "--"], ["&#8212;", "--"], 
    ["&#8211;","-"], ["&#8230;", "..."], ["&#215;", " x "], ["&#8482;","(TM)"], 
    ["&#174;","(R)"], ["&#169;","(C)"], ["&#8217;", "'"]
  ]
  
  def test_entities
    ENTITIES_TEST.each do |html, textile|
      test_html = ClothRed.new(html)
      result = test_html.to_textile
      assert_equal(textile,result)
    end
  end
end
