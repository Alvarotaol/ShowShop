class CreateProdutos < ActiveRecord::Migration
  def change
    create_table :produtos do |t|
      t.string :nome
      t.string :marca

      t.timestamps null: false
    end
  end
end
