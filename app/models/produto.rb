class Produto < ActiveRecord::Base
  has_attached_file :imagem, :styles => { :medium => "350x350>", :thumb => "250x150#", :front => "800x300",  }
  validates_attachment_content_type :imagem, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  #validates_attachment_presence :imagem
  belongs_to :loja
    has_and_belongs_to_many :categoriums
	
	def self.buscar(b)
		where("nome LIKE \"%#{b}%\"")
	end
	
end
