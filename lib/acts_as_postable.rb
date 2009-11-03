module ActsAsPostable

  def add_to_post(post_id)
    post = Post.find(post_id)
    
    post_part = post.post_parts.new
    post_part.save
    
    post_content = PostContent.new
    post_content.post_part = post_part
    post_content.content = self
    post_content.save
    
    post_part
  end
	
end