class Produto < ActiveRecord::Base
  has_attached_file :imagem, :styles => { :medium => "300x300>", :thumb => "120x90#" }
end
