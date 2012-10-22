class CombineItemsInCart < ActiveRecord::Migration
  def up
  	Cart.all.each do |c|
  		sums = c.line_items.group(:product_id).sum(:quantity)
  		sums.each do |product_id, quantity|
  			if quantity > 1			
  				c.line_items.where(:product_id => product_id).delete_all

  				c.line_items.create(:product_id => product_id, quantity: quantity)
  			end
  		end
  	end
  end

  def down
  	LineItem.where("quantity>1").each do |line|
  		line.quantity.times do
  			LineItem.create :cart_id => line.cart_id, :product_id => line.product_id,
  							quantity: 1
  		end
  		line.destroy
  	end
  end
end
