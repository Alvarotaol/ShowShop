class Produto < ActiveRecord::Base
  has_attached_file :imagem
  validates_attachment_content_type :imagem, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
