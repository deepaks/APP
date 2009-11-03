var SlideShow = Class.create();

SlideShow.prototype = {
	initialize: function(container, images){
		this.container = $(container);
		if( !this.container ){
			throw "SlideShow: Invalid container element";
			return null;
		}
		this.images = [];
		images.each(function(e, i){
			this.images.push({
				info: e,
				element: null
			});
		}, this);
		this.options = Object.extend({
			template: '<div id="#{id}" class="SlideShowItem" style="display: none; ">' + 
							'<img alt="#{caption}" src="#{src}" />' +
							'<div class="image_caption">Picture #NUM# / #ALL#:  #{caption}</div>' +
					  '</div>',
			swap: function(container, current, swap, scope){
				if( current ){
					// new Effect.Parallel([
					// 	new Effect.Fade(current, {
					// 		sync: true
					// 	}),
					// 	new Effect.Appear(swap, {
					// 		sync: true
					// 	})
					// ], {queue: {position: 'end', scope: scope}});
					new Effect.Fade(current, {duration: 0.3, queue: {position: 'front', scope: scope}});
					new Effect.Appear(swap, {duration: 0.3,	queue: {position: 'end', scope: scope},	afterFinish:resizeViewport	});
					
				}else{
					new Effect.Appear(swap, {duration: 0.3,queue: {position: 'end', scope: scope},	afterFinish:resizeViewport});
				}
			},
			active_class: 'active'
		}, arguments[2] || {});
		this.options.template = new Template(this.options.template);
		
		/* wire up all the elements */
		this.id = this.container.identify();
		var gotos = $$('[class*=' + this.id + '_goto_]');
		this.gotos = $H();
		gotos.each(function(g){
			var re = new RegExp(this.id + '_goto_([0-9]+)');
			var matches = re.exec(g.className);
			if( matches ){
				var m = parseInt(matches[1]);
				g.observe('click', this.gotoIndex.bindAsEventListener(this, m));
				this.gotos.set( m, (this.gotos.get(m) || []).concat([g]) );
			}
		}, this);
		
		this.prev_elements = $$('.' + this.id + '_action_previous');
		this.next_elements = $$('.' + this.id + '_action_next');
		this.prev_elements.invoke('observe', 'click', this.previous.bindAsEventListener(this));
		this.next_elements.invoke('observe', 'click', this.next.bindAsEventListener(this));
		
		this.loaders = $$('.' + this.id + '_loading');
		this.current_index = null;
		this.to_animate = null;
		this.gotoIndex(0);
	},
	gotoIndex: function(){
		var index = null;
		if( arguments.length == 2){
			try{
				arguments[0].stop();
			}catch(e){}
			index = arguments[1];
		}else{
			index = arguments[0];
		}
		index = this._getIndex(index);
		var add = this.to_animate!=null?this.gotos.get(this.to_animate):null;
		if( add && this.current_index != null ){
			add.concat(this.gotos.get(this.current_index)||[]);
		}
		this.to_animate = index;
		var remove = this.gotos.get(index);
		if( add ) add.invoke('removeClassName', this.options.active_class);
		if( remove ) remove.invoke('addClassName', this.options.active_class);
		
		if( !this.images[index].loaded){
			if (!this.images[index].loading) {
				this.doLoad(index);
			}
		}else{
			this.doIt(index);
		}
	},
	next: function(){
		var args = this._assembleArguments(arguments, [this.to_animate + 1]);
		this.gotoIndex.apply(this, args);
	},
	previous: function(){
		var args = this._assembleArguments(arguments, [this.to_animate - 1]);
		this.gotoIndex.apply(this, args);
	},
	_assembleArguments: function(){
		return $A(arguments[0]||[]).concat(arguments[1]||[]);
	},
	doLoad: function(index){
		this.images[index].loading = true;
		this._toggleLoading(true);
		this.images[index].info.id = 'image' + index;
				
		content = this.options.template.evaluate(this.images[index].info);
		
		content = content.replace("#NUM#",(index + 1)).replace("#ALL#",this.images.length);
		
		image_flip = this.container.insert(content);
		new Tooltip(image_flip, "click to view next picture");
		this._processElement.bind(this).defer(index);
	},
	doIt: function(index){
		this.images[index].loading = false;
		this.images[index].loaded = true;
		this._toggleLoading(false);
		if( index == this.to_animate && index != this.current_index ){
			var current_element = this.current_index!=null?this.images[this.current_index].element:null;
			var new_element = this.images[index].element;
			var dir = this.current_index==null||index>this.current_index?1:-1;
			this.current_index = index;
			//this.options.swap(this.container, current_element, new_element, dir, this.id);	
			this.options.swap(this.container, current_element, new_element, this.id);	
		}
	},
	_processElement: function(index){
		var elm = $(this.images[index].info.id);
		elm.observe('click',this.next.bindAsEventListener(this));
		this.images[index].element = elm;
		if( !this.images[index].element ){
			throw "SlideShow: image element was not properly created";
		}
		var i = new Image();
		i.onload = this.doIt.bind(this, index);
		i.src = this.images[index].info.src;
	},
	_getIndex: function(index){
		if( index > this.images.length - 1){
			return 0;
		}else if( index < 0 ){
			return this.images.length - 1;
		}else{
			return index;
		}
	},
	_toggleLoading: function(s){
		this.loaders.invoke((s?'show':'hide'));
	}
};