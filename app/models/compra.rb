class Compra < ActiveRecord::Base
	has_many :item_compras
	has_many :produtos, :through => :item_compras
	belongs_to :usuario
	belongs_to :loja
end
