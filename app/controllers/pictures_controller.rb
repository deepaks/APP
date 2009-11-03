class PicturesController < ApplicationController
  before_filter :require_firm_site, :only => [:new, :create, :edit, :update]

  # API_KEY = "6d2c1fc9f3ad827b5b9bf37d9dc334e7"
  # SHARED_SECRET = "a609b65ef592ef28"

  def index
    render :action => 'view'
  end

  def view
    flickr = Flickr.new(RAILS_ROOT + "/config/flickr.cache", \
    API_KEY, SHARED_SECRET)
    @photos = flickr.people.getPublicPhotos( \
    flickr.people.findByUsername("briandiesel"))
  end



  def upload
    incoming_file = params['flickr_image']
    content_type = incoming_file.content_type.chomp
    msg_out = nil

    responds_to_parent do
      render :update do |page|
        if content_type.rindex(/image\/[(jpe?g)||(gif)||(png)]/)
          cache_file = "#{RAILS_ROOT}/public/cache/flickr.cache"

          if File.exist? cache_file
            flickr = Flickr.new(cache_file)

            msg_out = flickr.photos.upload.upload_image( incoming_file, content_type, incoming_file.original_filename, params[:flickr_title], params[:flickr_description], params[:flickr_tags].scan(/"[\w ]+"|\w+/).collect{ |tag|
              tag.gsub( /"/, '' ) }
              )
            end
          else
            page.alert "Please upload an image file."
          end
        end
      end
      return
    end

    def show
      @picture = Picture.find(params[:id])
    end

    def new
      @one = Picture.new

      # for now
      # @one.post_part = PostPart.new
      # @one.post_part.post = Post.new

      @projects = current_account.projects
    end

    def create
      @one = Picture.new(params[:picture])
      @one.account = current_account

      if @one.save

        

        if params[:post]
          @post_part = @one.add_to_post(params[:post][:id])
          @post = @post_part.post
        end 

        responds_to_parent do
          render :update do |page|
            @item_id = params[:item][:id]
            page.replace @item_id, :partial => "pictures/one", :locals => {:one => @one,:post_part => @post_part}
            update_postpart_sortable(page)
          end
        end


        # respond_to do |format|
        #   format.html do
        #     flash[:notice] = "Successfully created picture."
        #     redirect_to @one
        #   end
        #   format.js do
        #     @item_id = params[:item][:id]
        #   end
        # end

      else
        render :action => 'new'
      end
    end

    def edit
      @picture = Picture.find(params[:id])
      @projects = current_account.projects
    end

    def update
      @one = Picture.find(params[:id])

      #save_project

      if @one.update_attributes(params[:picture])
        responds_to_parent do
          render :update do |page|
            @item_id = params[:item][:id]
            @post_part = PostPart.find(params[:item][:post_part_id])
            @post = @post_part.post
            page.replace @item_id, :partial => "pictures/one", :locals => {:one => @one,:post_part => @post_part}
            update_postpart_sortable(page)
          end
        end

        # respond_to do |format|
        #   format.html do
        #     flash[:notice] = "Successfully updated picture."
        #     redirect_to @one
        #     
        #   end
        #   format.js do
        #     responds_to_parent do
        #       render :update do |page|
        #         @item_id = params[:item][:id]
        #         page << "alert('yo')"
        #         page.replace @item_id, :partial => "pictures/one", :locals => {:one => @one}
        #         update_postpart_sortable(page)
        #       end
        #     end
        #   end
        # end


      else
        render :action => 'edit'
      end
    end

    def destroy
      @picture = Picture.find(params[:id])
      @picture.destroy
      flash[:notice] = "Successfully destroyed picture."
      redirect_to pictures_url
    end
    
    def upload_to_post
      # SWFUpload file
      if params[:Filedata]
        @one = Picture.new(:swfupload_file => params[:Filedata])
        @one.account = current_account
        @one.save
        
        @post_part = @one.add_to_post(params[:post_id])
        @post = @post_part.post
      else

      end
    end
    
    def toggle_featured
      @picture = Picture.find(params[:id])
      @picture.featured = !@picture.featured
      @picture.save!
    end

  end
