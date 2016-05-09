json.array!(@lotes) do |lote|
  json.extract! lote, :id, :qtd_lote, :preco, :t_lote
  json.url lote_url(lote, format: :json)
end
