class LojasController < ApplicationController
	before_action :set_compra, only: [:adicionar, :carrinho]
	before_action :set_loja, only: [:show, :edit, :update, :destroy, :produtos]
	before_action :redir_cliente, only: [:new, :edit, :create, :update, :destroy]
    
    # GET /lojas
  # GET /lojas.json
	def index
		@lojas = Loja.all
        if @vemdecat == false || @vemdecat.nil?
        @produtos = Produto.all
        end
	end

  # GET /lojas/1
  # GET /lojas/1.json
  def show
  end

  # GET /lojas/new
  def new
    @loja = Loja.new
  end

  # GET /lojas/1/edit
  def edit
  end

  # POST /lojas
  # POST /lojas.json
  def create
    @loja = Loja.new(loja_params)

    respond_to do |format|
      if @loja.save
        format.html { redirect_to @loja, notice: 'A loja foi criada com sucesso.' }
        format.json { render :show, status: :created, location: @loja }
      else
        format.html { render :new }
        format.json { render json: @loja.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lojas/1
  # PATCH/PUT /lojas/1.json
  def update
    respond_to do |format|
      if @loja.update(loja_params)
        format.html { redirect_to @loja, notice: 'A loja foi atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @loja }
      else
        format.html { render :edit }
        format.json { render json: @loja.errors, status: :unprocessable_entity }
      end
    end
  end

	# DELETE /lojas/1
	# DELETE /lojas/1.json
	def destroy
		@loja.destroy
		respond_to do |format|
			format.html { redirect_to lojas_url, notice: 'A loja foi removida com sucesso.' }
			format.json { head :no_content }
		end
	end
	
	
    def filtrar
        @produtos = Loja.find(params[:loja_id]).produtos
        @produtos = @produtos.select do |p|
            p.categorias.include?(params[:id_cat])
        end
        @vemdecat = true
        redirect_to loja_produtos_path
    end
    
    private
	# Use callbacks to share common setup or constraints between actions.
	def set_compra
		@loja = Loja.find(params[:loja_id])
		@compra
		if session[:carr] == {}
			@compra = Compra.new({:usuario => current_usuario, :loja => @loja})
			@compra.save
			session[:carr] = @compra.id.class
		else
			@compra = Compra.find(session[:carr])
		end
		@itens = ItemCompra.find_by_compra_id @compra
	end
	
    
	def set_loja
		@loja = Loja.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def loja_params
		params.require(:loja).permit(:nome, :cnpj, :imagem)
	end

    # Never trust parameters from the scary internet, only allow the white list through.
    def loja_params
        params.require(:loja).permit(:nome, :cnpj, :imagem, :categorias)
    end
  
    def redir_cliente
      unless current_usuario.try(:fornecedor?)
        redirect_to lojas_url
      end
    end
end
