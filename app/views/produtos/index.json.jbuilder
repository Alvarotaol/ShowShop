json.array!(@produtos) do |produto|
  json.extract! produto, :id, :nome, :marca
  json.url produto_url(produto, format: :json)
end
