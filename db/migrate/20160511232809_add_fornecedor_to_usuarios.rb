class AddFornecedorToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :fornecedor, :boolean, default: false
  end
end
