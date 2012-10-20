require 'spec_helper'

describe "products/index" do
  before(:each) do
    assign(:products, [
      stub_model(Product,
        :title => "Title",
        :description => "MyText",
        :image_url => "Image Url",
        :price => "9.99"
      ),
      stub_model(Product,
        :title => "Title",
        :description => "MyText",
        :image_url => "Image Url",
        :price => "9.99"
      )
    ]) 
  end

  it "renders a list of products" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "dl>dt", :text => "Title".to_s, :count => 2
    assert_select "dl>dd", :text => "MyText".to_s, :count => 2
    assert_select "td>img", :href => "Image Url".to_s, :count => 2
    #assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
