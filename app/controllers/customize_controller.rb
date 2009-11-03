class CustomizeController < ApplicationController
  
  before_filter :require_firm_site
  
  def index
    @style_file = ""
    stylesheet = "#{RAILS_ROOT}/public" + current_stylesheet
    if File.readable?(stylesheet)
      File.open(stylesheet,"r").each_line do |line|
        @style_file = @style_file + line
      end
    end
  end
  
  def update
    styles = params[:css][:file]
    stylesheet = "#{RAILS_ROOT}/public" + current_stylesheet
    if File.writable?(stylesheet)
      File.open(stylesheet, 'w') {|f| f.write(styles) }
      flash[:notice] = "stylesheet successfully updated"
    else
      flash[:error] = "cannot update stylesheet"
    end
    redirect_to :action => :index
  end
end
