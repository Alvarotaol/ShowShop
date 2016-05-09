class CreateLotes < ActiveRecord::Migration
  def change
    create_table :lotes do |t|
      t.integer :qtd_lote
      t.decimal :preco
      t.integer :t_lote

      t.timestamps null: false
    end
  end
end
