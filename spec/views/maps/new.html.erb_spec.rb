require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/maps/new.html.erb" do
  include MapsHelper

  before(:each) do
    assigns[:map] = stub_model(Map,
      :new_record? => true
    )
  end

  it "renders new map form" do
    render

    response.should have_tag("form[action=?][method=post]", maps_path) do
    end
  end
end
