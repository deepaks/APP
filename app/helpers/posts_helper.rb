module PostsHelper
	def update_postpart_sortable(page)
		page.sortable('post_parts', :url => {:controller => :posts, :action => :sort, :id => @post.id}, :handle => "span.drag_handle", :complete => visual_effect(:highlight, "post_parts"))
	end
	
	def view_post_path(post)
    {:controller => :posts,:action => :view, :id => post}
  end
end
