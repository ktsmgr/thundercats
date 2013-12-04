class Product < ActiveRecord::Base
	has_many :categories, through: :product_categories
	has_many :product_categories, dependent: :destroy
	has_many :line_items

	validates_presence_of :name, :unit_price, :description, :sku, :brand, :model_num
	validates_presence_of :unit_price

  has_attached_file :photo, :styles => { :medium => "200x300#", :thumb => "200x100#" }, :default_url => "/images/:style/missing.png"

  paginates_per 6

end
