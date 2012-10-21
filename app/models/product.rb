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

class Product < ActiveRecord::Base
	
  attr_accessible :description, :image_url, :price, :title
  has_many :line_items
  before_destroy  :ensure_not_reference_by_any_line_items
  default_scope :order => 'title'

  
  format_image = %r{\.(gif|jpg|png)$}i
  validates :description, :image_url, :title, presence: true
  validates :price, :numericality => {:greater_than => :precio_minimo}
  validates :image_url, format: { with: format_image,
  		 message: 'Tiene que ser una url para GIF, JPG o PNG' }
  validates :description, length: { minimum: 10 }
  validates :title, length: { maximum: 50 },uniqueness: true
  private

  def precio_minimo
  	return 0.05
  end

  def ensure_not_reference_by_any_line_items
    if line_items.empty?
      return true
    else
      errors.add(:base,'Line Item present')
      return false
    end
  end

end
