class AddColumnQtdLoteToProduto < ActiveRecord::Migration
  def change
    add_column :produtos, :qtd_lote, :string
  end
end
