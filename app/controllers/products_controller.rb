class ProductsController < ApplicationController
  before_action :set_product, :authentication, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    render json: @products, status:  200
  end

  # GET /products/1
  # GET /products/1.json
  def show
   render json: @product, status:  200
   end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: 201, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: 422}
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
      if @product.update(product_params)
        render json: @product, status: 200
      else
         render json: @product.errors, status: 422
      end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      #params.require(:product).permit(:name, :description, :state)
      params.permit(:name, :description, :state, :user_id)
    end
end
