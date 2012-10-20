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
  
  describe "with blanks attributes" do
  	it "should not be valid" do
  		Product.create(title: "as").should_not be_valid
  	end
  end
end
