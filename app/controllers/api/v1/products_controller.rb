class Api::V1::ProductsController < ApplicationController
  respond_to :json

  def index
    respond_with Product.search(params).order(:title)
  end

  def show
    product = Product.find(params[:id])
    respond_with product
  end

  def create
    product = Product.build(product_params)
    if product.save
      render json: product, status: 201, location: [:api, product]
    else
      render json: { errors: product.errors }, status: 422
    end
  end

  def update
    product = Product.find(params[:id])
    if product.update(product_params)
      render json: product, status: 201, location: [:api, product]
    else
      render json: { errors: product.errors }, status: 422
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    respond_with 204
  end

  private

  def product_params
    params.require(:product).permit(:title, :price, :image)
  end
end