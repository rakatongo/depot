require 'spec_helper'

describe "products/new" do  
  before { visit new_product_path }
  subject { page }

  it { should have_selector('h1', text: 'New product')}
  #before(:each) do
  #  assign(:product, stub_model(Product,
  #    :title => "MyString",
  #    :description => "MyText",
  #    :image_url => "MyString",
  #    :price => "9.99"
  #  ).as_new_record)
  #end

  #it "renders new product form" do
  #  render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
  #  assert_select "form", :action => products_path, :method => "post" do
  #    assert_select "input#product_title", :name => "product[title]"
  #    assert_select "textarea#product_description", :name => "product[description]"
  #    assert_select "input#product_image_url", :name => "product[image_url]"
  #    assert_select "input#product_price", :name => "product[price]"
  #  end
  #end
      
  
 # describe "with invalid information" do 
  #  before do 
       
   #    fill_in "Title", with: ""
    #   fill_in "Title", with: "MyString"
     #  fill_in "Description", with: "Una description"
      # fill_in "Image Url", with: "someimage.jpg"
       #fill_in "Price", with: 9.55
    #end
    #let(:enviar){ "Create Product" }

    #describe "Mostrando errores" do      
     # before { click_button enviar }
      #it { should have_content('error') }
    #end

  #end # <<<<<<<<<< With invalid infor
end
 