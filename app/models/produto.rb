class Produto < ActiveRecord::Base
  has_attached_file :imagem, :styles => { :medium => "300x300>", :thumb => "50x50#" }
  validates_attachment_content_type :imagem, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  #validates_attachment_presence :imagem
  belongs_to :loja
    has_and_belongs_to_many :categoriums
end
