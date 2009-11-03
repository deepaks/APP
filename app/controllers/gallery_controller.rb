class GalleryController < ApplicationController
  before_filter :require_firm_site
  before_filter :require_account_member
  
  def index
    @media = current_account.pictures # + current_account.videos
  end
  
  def upload_new
    # SWFUpload file
    if params[:Filedata]
      @picture = Picture.new(:swfupload_file => params[:Filedata])
      @picture.account = current_account
      @picture.save
    else

    end
  end
end
