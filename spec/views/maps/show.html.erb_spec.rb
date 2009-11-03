require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/maps/show.html.erb" do
  include MapsHelper
  before(:each) do
    assigns[:map] = @map = stub_model(Map)
  end

  it "renders attributes in <p>" do
    render
  end
end
