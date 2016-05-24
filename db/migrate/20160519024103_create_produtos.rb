class CreateProdutos < ActiveRecord::Migration
  def change
    create_table :produtos do |t|
      t.string :nome
      t.string :marca
        t.string :categorias
      t.references :loja, index: true, foreign_key: true
        t.timestamps null: false
    end
  end
end

