class CreateInfoLojas < ActiveRecord::Migration
  def change
    create_table :info_lojas do |t|
        t.string :chave
        t.references :loja, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
