json.array!(@produtos) do |produto|
  json.extract! produto, :id, :nome, :preco, :t_lote
  json.url produto_url(produto, format: :json)
end
