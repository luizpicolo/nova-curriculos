require 'rails_helper'

RSpec.describe StaticPagesController, :type => :controller do

  describe "GET not_registered" do
    it "returns http success" do
      get :not_registered
      expect(response).to be_success
    end
  end

end
