# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  image_url   :string(255)
#  price       :decimal(8, 2)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe Product do
  before { @producto = Product.new(:title => "Ejemplox",
  	:description => "DEscription ejemplo", image_url: "some_img.jpg",
  	price: 5.40)}
  subject { @producto }

  it { should respond_to(:title)}
  it { should respond_to(:description)}
  it { should respond_to(:image_url)}
  it { should respond_to(:price)}
  it { should be_valid}

  describe "price should be a mayor que 0.10" do
  	before { @producto.price = 0.04 }
  	it { should be_invalid }
  end

  describe "price should be a number" do
  	before { @producto.price = "asda1.51"}
  	it { should be_invalid }
  end

  describe "image_url deve terminar con jpg o png" do
  	before { @producto.image_url = "daniel"}
  	it { should be_invalid }
  end

  describe "description should be mayor que 10 letras" do
  	before { @producto.description = "aasda"}
  	it { should be_invalid }
  end

  describe "title should not be mayor que 50 letras" do
  	before { @producto.title = "a" * 51}
  	it { should be_invalid }
  end
  describe "title should be unique" do
  	before do
  		FactoryGirl.create(:product)
  		@producto.title = "Example Product"
  	end
  	it { should be_invalid }
  end

  
end
