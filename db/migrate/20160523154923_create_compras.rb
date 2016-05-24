class CreateCompras < ActiveRecord::Migration
  def change
    create_table :compras do |t|
      t.references :usuario, index: true, foreign_key: true
      t.references :loja, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
