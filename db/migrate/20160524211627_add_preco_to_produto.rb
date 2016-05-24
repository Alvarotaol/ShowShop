class AddPrecoToProduto < ActiveRecord::Migration
  def change
	  add_column :produtos, :preco, :float
	  add_column :produtos, :descricao, :text
  end
end
