class MapsController < ApplicationController
   before_filter :require_firm_site, :only => [:new, :create, :edit, :update]
  #require 'rubygems'
	#require 'google_geocode'

  def index
    @map = GMap.new("map_div")
    @map.control_init(:large_map => true,:map_type => true)
   # @map.center_zoom_init([75.5,-42.56],4)
   # @map.overlay_init(GMarker.new([75.6,-42.467],:title => "Hello", :info_window => "Info! Info!"))
    results = Geocoding::get("68 Jay Street Brooklyn")
	  if results.status == Geocoding::GEO_SUCCESS
	  coord = results[0].latlon
	  @map.overlay_init(GMarker.new(coord,:info_window => "Our Office"))
	  @map.center_zoom_init([75.5,-42.56],4)
	 end
		  


# @map.overlay_init(GMarker.) 
  end
  
  def update
    @map = Variable.new("map")
    @marker = GMarker.new([75.89,-42.767],:title => "Update", :info_window => "I have been placed through RJS")
  end
 

end
