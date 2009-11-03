GalleryStripeOptions = Object.extend({
    scrollAmount: 10,
		scrollDuration: 0.1,
		stepAmount: 160,
		stepDuration: 0.5,
		stripeWindowWidth: 1200,
		stripeCellWidth: 166,
		stripeCellMargin: 6,
		stripeMargin: 2,
}, window.GalleryStripeOptions || {});

var GalleryStripe = Class.create();

GalleryStripe.prototype = {
	scroller: undefined,
	scrolling: false,
	resetScroll: false,
	stripeWidth: 0,
	itemCount: 0,
	dir: -1,
	initialize: function(){
		$('projects_list').setStyle('left',GalleryStripeOptions.stripeMargin);
		itemCount = $$('#projects_list li').length;
		this.stripeWidth = (itemCount * GalleryStripeOptions.stripeCellWidth + (itemCount + 1) * GalleryStripeOptions.stripeCellMargin) + 2 * GalleryStripeOptions.stripeMargin;
		
		
		//no scrolling if stripe is narrower than the window
		
		if (this.stripeWidth > GalleryStripeOptions.stripeWindowWidth)
		{
			$('scroll-left').observe('click', (function(e){this.stepGallery(true);}).bind(this));
			$('scroll-right').observe('click', (function(e){this.stepGallery(false);}).bind(this));
			$('scroll-left').observe('mouseover', (function(e){
					this.scrolling = true;
					this.dir = 1;
					this.initPeriodicalExec();
				}).bind(this));
			$('scroll-right').observe('mouseover', (function(e){
					this.scrolling = true; 
					this.dir = -1;
					this.initPeriodicalExec();
				}).bind(this));
			$('scroll-left').observe('mouseout', (function(e){
				this.scrolling = false; 
				this.scroller = undefined;}).bind(this));
			$('scroll-right').observe('mouseout', (function(e){
				this.scrolling = false; 
				this.scroller = undefined;}).bind(this));

			$('gallery').observe('mouseover', (function(e){
					gallery = $('gallery');
					this.scrolling = true; 
					this.dir = (e.clientX <= gallery.offsetLeft + gallery.getWidth() / 2) ? 1 : -1;
					this.initPeriodicalExec();
					}).bind(this));

			$('gallery').observe('mouseout', (function(e){
				this.scrolling = false; 
				this.scroller = undefined;}).bind(this));
		}
		else
		{
			$('scroll-left').hide();
			$('scroll-right').hide();
		}
		
		
	},
	
	initPeriodicalExec: function(){
		
		new PeriodicalExecuter((function(pe){
				if (this.scrolling){
					if (pe.direction != undefined && pe.direction != this.dir)
					{
						pe.stop();
						this.resetScroll = false;
					}
					pe.direction = this.dir;
					this.scrollGallery(this.dir > 0)
				} 
			 	else{
					pe.stop();
				}
			}).bind(this), GalleryStripeOptions.scrollDuration);
		
	},
	
	calculateNextMove: function(desired){
		
		//return desired;
		
		if ($('projects_list').getStyle('left') == null)
		{
			currentPos = GalleryStripeOptions.stripeMargin;
		}
		else
		{
			currentPos = $('projects_list').getStyle('left').replace('px','') * 1.0;
		}
		
		if (GalleryStripeOptions.stripeWindowWidth > this.stripeWidth)
		{
			leftBound = GalleryStripeOptions.stripeMargin;
			rightBound = GalleryStripeOptions.stripeWindowWidth - this.stripeWidth - GalleryStripeOptions.stripeMargin;
		}
		else
		{
			rightBound = GalleryStripeOptions.stripeMargin;
			leftBound = GalleryStripeOptions.stripeWindowWidth - this.stripeWidth - GalleryStripeOptions.stripeMargin;
		}
		
		nextMove = desired;
		if ((currentPos + nextMove) < leftBound )
		{
			nextMove = leftBound - currentPos;
		}
		else if ((currentPos + nextMove) >= rightBound)
		{
			nextMove = rightBound - currentPos;
		}
		//console.info(currentPos + "," + nextMove);
		
		if ((this.dir > 0 && nextMove < 0) || (this.dir > 0 && nextMove < 0))
		{
			nextMove = 0;
		}
		
		return nextMove;
	},
	
	stepGallery: function(forward){
		this.scrolling = false;
		nextMove = this.calculateNextMove( (forward ? 1 : -1) * GalleryStripeOptions.stepAmount );
		new Effect.Move('projects_list', { x: nextMove, y: 0, mode: 'relative',duration: GalleryStripeOptions.stepDuration });
	},
	
	scrollGallery: function(forward){
		nextMove = this.calculateNextMove( (forward ? 1 : -1) * GalleryStripeOptions.scrollAmount );
		new Effect.Move('projects_list', { x: nextMove, y: 0, mode: 'relative',duration: GalleryStripeOptions.scrollDuration });
	}
}

Event.observe(window, 'load', function() {
  galleryStripe = new GalleryStripe();
});