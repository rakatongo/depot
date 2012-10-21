require 'spec_helper'

describe StoreController do

	def valid_attributes
	    {title: "Ejemplo", description: "Description ejemplo",
	    image_url: "image_url.png", price: 4.33}
	end

	def valid_session
		{}
	end



  describe "GET 'index'" do
  	before { FactoryGirl.create(:product) }
  	#let(:producto){  }
  	
    #it "returns http success" do
    #  get :root_path
    #  response.should be_success
    #end
    it "assigns all products as @products" do      

      get :index, {}, valid_session
      assigns(:products).count.should eq 1
    end
  end

end
