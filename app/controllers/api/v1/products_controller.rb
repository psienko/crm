class Api::V1::ProductsController < ApplicationController
  respond_to :json

  before_action :authenticate_employee!
  expose(:products)
  expose(:product) { Product.find(params[:id]) }

  def index
    if params[:search].eql?('search') && params[:product].present?
      respond_with Product.search(params[:product])
    else
      respond_with products
    end
  end

  def show
    respond_with product
  end

  def create
    respond_with :api, :v1, Product.create(product_params)
  end

  def update
    product.update(product_params)
    respond_with product
  end

  def destroy
    respond_with product.destroy
  end

  private

  def person_params
    params.require(:product)
    .permit(:name, :prize)
  end
end
