class Mymi < ActiveRecord::Migration
  def change
      create_table :lojas do |t|
      t.string :nome
      t.string :cnpj
      t.timestamps null: false
    end
  end
end
