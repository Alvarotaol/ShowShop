class RemoveQtdLoteFromProduto < ActiveRecord::Migration
  def change
    remove_column :produtos, :qtd_lote, :string
    remove_column :produtos, :t_lote, :integer
    remove_column :produtos, :preco, :decimal
    add_column :produtos, :marca, :string
  end
end
