class AddProdutoToLote < ActiveRecord::Migration
  def change
    add_reference :lotes, :produto, index: true, foreign_key: true
  end
end
