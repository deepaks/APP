# test_tables.rb
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

class TestClothRedTables < Test::Unit::TestCase
 
  TABLES_TEST = [
    ["<table><tr><td>name</td><td>age</td><td>sex</td></tr><tr><td>joan</td><td>24</td><td>f</td></tr></table>",
    "|name|age|sex|\n|joan|24|f|\n"], 
    ["<table><tr><th>name</th><th>age</th><th>sex</th></tr><tr><td>joan</td><td>24</td><td>f</td></tr></table>",
    "|_.name|_.age|_.sex|\n|joan|24|f|\n"]
  ]
  
  def test_entities
    TABLES_TEST.each do |html, textile|
      test_html = ClothRed.new(html)
      result = test_html.to_textile
      assert_equal(textile,result)
    end
  end
end