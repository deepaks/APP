# test_formatting.rb
# 10. April 2007
#

#circumventing a require Problem:
$:.unshift File.join(File.dirname(__FILE__), "..", "lib")

begin
  require "rubygems"
  require "clothred"
rescue LoadError
  require "clothred"
end

require "test/unit"

class TestClothRedFormatting <  Test::Unit::TestCase
  
  FORMATTING_STRINGS = [
    ["<b>bold</b>","**bold**"], ["<strong>strong</strong>", "*strong*"], 
    ["<em>emphasized</em>", "_emphasized_"],["<i>italics</i>", "__italics__"], 
    ["<cite>citation</cite>", "??citation??"], 
    ["<code>ClothRed#to_textile</code>", "@ClothRed#to_textile@"], 
    ["<del>delete</del>", "-delete-"], ["<ins>underline</ins>", "+underline+"], 
    ["<sup>superscript</sup>","^superscript^"], ["<sub>subscript</sub>","~subscript~"] 
  ]
 
  def test_textformatting
    FORMATTING_STRINGS.each do |html, textile|
      test_html = ClothRed.new(html)
      result = test_html.to_textile
      assert_equal(textile,result)
    end
  end

end