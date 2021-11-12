class Product < ApplicationRecord
  belongs_to :category
  has_many :reviews
  
  def reviews_new
      reviews.new
  end
  
  #いいね機能
  acts_as_likeable
end
