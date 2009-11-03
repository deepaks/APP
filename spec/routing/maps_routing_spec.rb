require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe MapsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "maps", :action => "index").should == "/maps"
    end

    it "maps #new" do
      route_for(:controller => "maps", :action => "new").should == "/maps/new"
    end

    it "maps #show" do
      route_for(:controller => "maps", :action => "show", :id => "1").should == "/maps/1"
    end

    it "maps #edit" do
      route_for(:controller => "maps", :action => "edit", :id => "1").should == "/maps/1/edit"
    end

    it "maps #create" do
      route_for(:controller => "maps", :action => "create").should == {:path => "/maps", :method => :post}
    end

    it "maps #update" do
      route_for(:controller => "maps", :action => "update", :id => "1").should == {:path =>"/maps/1", :method => :put}
    end

    it "maps #destroy" do
      route_for(:controller => "maps", :action => "destroy", :id => "1").should == {:path =>"/maps/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/maps").should == {:controller => "maps", :action => "index"}
    end

    it "generates params for #new" do
      params_from(:get, "/maps/new").should == {:controller => "maps", :action => "new"}
    end

    it "generates params for #create" do
      params_from(:post, "/maps").should == {:controller => "maps", :action => "create"}
    end

    it "generates params for #show" do
      params_from(:get, "/maps/1").should == {:controller => "maps", :action => "show", :id => "1"}
    end

    it "generates params for #edit" do
      params_from(:get, "/maps/1/edit").should == {:controller => "maps", :action => "edit", :id => "1"}
    end

    it "generates params for #update" do
      params_from(:put, "/maps/1").should == {:controller => "maps", :action => "update", :id => "1"}
    end

    it "generates params for #destroy" do
      params_from(:delete, "/maps/1").should == {:controller => "maps", :action => "destroy", :id => "1"}
    end
  end
end
