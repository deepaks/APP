// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

var resizeViewport = function(){
						autoHeight = $('sidebar').getHeight() + "px";
						$('viewport').setStyle({height:autoHeight});
						Scroller.updateAll();
					}