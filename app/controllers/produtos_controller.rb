class ProdutosController < ApplicationController
	before_action :set_compra_loja, only: [:adicionar, :index, :show, :carrinho]
	before_action :set_produto, only: [:show, :edit, :update, :destroy]
	before_action :redir_cliente, only: [:new, :edit, :create, :update, :destroy]

	# GET /produtos
	# GET /produtos.json
	def index
		@produtos = @loja.produtos
		@lojas = Loja.all
		@tam = @itens.length
	end

	# GET /produtos/1
	# GET /produtos/1.json
	def show
	end

	# GET /produtos/new
	def new
		@produto = Produto.new
	end

	# GET /produtos/1/edit
	def edit
	end

	# POST /produtos
	# POST /produtos.json
	#bug impedir que usuários digitem números e nomes muito grandes (obrigado, Victor)
	def create
		@produto = @loja.produtos.create(produto_params)
		respond_to do |format|
			if @produto.save
				format.html { redirect_to loja_produto_path(@loja, @produto), notice: 'Produto criado com sucesso.' }
				format.json { render :show, status: :created, location: @produto }
			else
				format.html { render :new }
				format.json { render json: @produto.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /produtos/1
	# PATCH/PUT /produtos/1.json
	def update
	 respond_to do |format|
		if @produto.update(produto_params)
		  format.html { redirect_to loja_produto_path(@loja, @produto)	, notice: 'O produto foi atualizado com sucesso.' }
		  format.json { render :show, status: :ok, location: @produto }
		else
		  format.html { render :edit }
		  format.json { render json: @produto.errors, status: :unprocessable_entity }
		end
	 end
	end

	# DELETE /produtos/1
	# DELETE /produtos/1.json
	def destroy
		@produto.destroy
		respond_to do |format|
			format.html { redirect_to produtos_url, notice: 'O produto foi removido com sucesso.' }
			format.json { head :no_content }
		end
	end

	def adicionar
		produto = Produto.find(params[:id])
		item = ItemCompra.new({:compra => @compra, :produto => produto, :qtd => 1})
		item.save
		redirect_to loja_produtos_path
	end
	
	def carrinho
		
	end
	
	private
	# Use callbacks to share common setup or constraints between actions.
	
	def set_compra_loja
		@loja = Loja.find(params[:loja_id])
		@compra
		if session[:carr] == {}
			@compra = Compra.new({:usuario => current_usuario, :loja => @loja})
			@compra.save
			session[:carr] = @compra.id
		else
			@compra = Compra.find(session[:carr])
		end
		@itens = @compra.item_compras
	end
	
	def set_produto
		@produto = @loja.produtos.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def produto_params
		params.require(:produto).permit(:nome, :preco, :marca, :t_lote, :imagem)
	end

	def redir_cliente
		unless current_usuario.try(:fornecedor?)
			redirect_to produtos_url
		end
	end
end
