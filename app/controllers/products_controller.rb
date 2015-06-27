class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_branch
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = @branch.products.all.page(params[:page]).per(20)
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = @branch.products.build
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = @branch.products.build(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to branch_products_path(@branch), notice: 'Produto criado com sucesso.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to branch_products_path(@branch), notice: 'Produto atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: [@branch, @product] }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to branch_products_url(@branch), notice: 'Produto deletado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = @branch.products.find(params[:id])
    end

    def set_branch
      @branch = current_user.branches.find(params[:branch_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :value, :branch_id)
    end
end
