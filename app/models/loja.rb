class Loja < ActiveRecord::Base
  has_many :produtos, dependent: :destroy
    has_attached_file :imagem
    validates :nome, presence: true
    validates :cnpj, presence: true, uniqueness: true
    validates_attachment_content_type :imagem, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
