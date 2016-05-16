class RenameColumnLoteToLoja < ActiveRecord::Migration
  def change
    rename_table :lotes, :lojas
  end
end
