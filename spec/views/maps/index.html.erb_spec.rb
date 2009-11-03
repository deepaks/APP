require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/maps/index.html.erb" do
  include MapsHelper

  before(:each) do
    assigns[:maps] = [
      stub_model(Map),
      stub_model(Map)
    ]
  end

  it "renders a list of maps" do
    render
  end
end
