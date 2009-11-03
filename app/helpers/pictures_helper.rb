module PicturesHelper
  def picture_upload_path_with_session_information(form_action, id = 0)
    session_key = ActionController::Base.session_options[:key]
    url_for(:controller => :pictures, :action => form_action, :id => id,session_key => cookies[session_key], request_forgery_protection_token => form_authenticity_token)
  end
  
  def upload_to_gallery_path_with_session_information
    session_key = ActionController::Base.session_options[:key]
    upload_to_gallery_path(session_key => cookies[session_key], request_forgery_protection_token => form_authenticity_token)    
  end
  
  def toggle_feature_picture_path(picture)
    {:controller => :pictures, :action => :toggle_featured, :id => picture}
  end
end
