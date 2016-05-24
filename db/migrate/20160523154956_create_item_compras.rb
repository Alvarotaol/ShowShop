class CreateItemCompras < ActiveRecord::Migration
  def change
    create_table :item_compras do |t|
      t.references :compra, index: true, foreign_key: true
      t.references :produto, index: true, foreign_key: true
      t.integer :qtd

      t.timestamps null: false
    end
  end
end
