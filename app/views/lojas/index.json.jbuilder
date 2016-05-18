json.array!(@lotes) do |lote|
  json.extract! lote, :nome
  json.url loja_url(loja, format: :json)
end
