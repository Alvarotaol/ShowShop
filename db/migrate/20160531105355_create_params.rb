class CreateParams < ActiveRecord::Migration
  def change
      create_table :info_clientes do |t|
        t.string :chave
        t.string :valor
        t.references :usuario, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
