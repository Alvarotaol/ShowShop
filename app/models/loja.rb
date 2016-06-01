class Loja < ActiveRecord::Base
  has_many :produtos, dependent: :destroy
    has_many :categoriums, dependent: :destroy
    has_many :info_loja, dependent: :destroy
    has_attached_file :imagem, :styles => { :medium => "300x300>", :thumb => "50x50#" }
    validates :nome, presence: true
    validates :cnpj, presence: true, uniqueness: true
    validates_attachment_content_type :imagem, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
