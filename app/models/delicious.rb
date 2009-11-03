
# Delicious API with HTTParty Gem
 
require 'rubygems'
require 'httparty'
 
class Delicious
  include HTTParty
  base_uri 'https://api.del.icio.us/v1'

  def initialize(auth)
    @auth = auth
  end

     
  # query params that filter the posts are:
  # tag (optional). Filter by this tag.
  # dt (optional). Filter by this date (CCYY-MM-DDThh:mm:ssZ).
  # url (optional). Filter by this url.
  # ie: posts(:query => {:tag => 'ruby'})
  def posts(options={})
    options.merge!({:basic_auth => @auth})
    # get posts and convert to structs so we can do .key instead of ['key'] with results
    self.class.get('/posts/get', options)
  end

  # query params that filter the posts are:
  # tag (optional). Filter by this tag.
  # count (optional). Number of items to retrieve (Default:15, Maximum:100).

  def recent(options={})
    options.merge!({:basic_auth => @auth})
  self.class.get('/posts/recent', options)

  end
end

     
# CHANGE USERNAME & PASS !!!
delicious = Delicious.new( :username => 'briandiesel', :password => 'dez68k' )
puts delicious.posts(:query => {:tag => 'ruby'}).inspect
puts
puts delicious.recent.inspect