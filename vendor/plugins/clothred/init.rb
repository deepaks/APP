begin
  require File.join(File.dirname(__FILE__), 'lib', 'clothred') # From here
rescue LoadError
  require 'ClothRed' # From gem
end