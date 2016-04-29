class AddColumnImagemToProduto < ActiveRecord::Migration
  def change
    add_column :produtos, :imagem, :string
  end
end
