class AlterarLojasEProdutos < ActiveRecord::Migration
  def change
    remove_column :lojas, :qtd_lote
    remove_column :lojas, :preco
    remove_column :lojas, :t_lote
    remove_column :lojas, :produto
    add_column :lojas, :nome, :string
  end
end
