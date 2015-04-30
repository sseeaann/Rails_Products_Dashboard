class Product < ActiveRecord::Base
	has_many :comments
	belongs_to :category
	validates :name, :description, :pricing, presence: true
	validates :name, :description, :length => { :minimum => 2 }
end
