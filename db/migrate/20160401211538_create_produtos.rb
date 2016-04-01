class CreateProdutos < ActiveRecord::Migration
  def change
    create_table :produtos do |t|
      t.string :nome
      t.decimal :preco
      t.integer :t_lote

      t.timestamps null: false
    end
  end
end
