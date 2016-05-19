class AddAttachmentImagemToLojas < ActiveRecord::Migration
  def self.up
    change_table :lojas do |t|
      t.attachment :imagem
    end
  end

  def self.down
    remove_attachment :lojas, :imagem
  end
end
