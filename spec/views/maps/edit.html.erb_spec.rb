require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/maps/edit.html.erb" do
  include MapsHelper

  before(:each) do
    assigns[:map] = @map = stub_model(Map,
      :new_record? => false
    )
  end

  it "renders the edit map form" do
    render

    response.should have_tag("form[action=#{map_path(@map)}][method=post]") do
    end
  end
end
