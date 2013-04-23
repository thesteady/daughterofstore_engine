class ProductReview < ActiveRecord::Base

  attr_accessible :product_id, :customer_id, :comment

  has_one :rating
  belongs_to :customer
  belongs_to :product
end