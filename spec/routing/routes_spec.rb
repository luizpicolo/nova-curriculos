require 'rails_helper'

RSpec.describe "routers", :type => :routing do
  it "should be valid for the root" do
    expect(:get => "/").to route_to(:controller => "home", :action => "index")
  end
end
