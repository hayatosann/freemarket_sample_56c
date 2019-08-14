class ProductsController < ApplicationController
  def index
  end
  
  def new
  end
  
  def show
    @product = Product.find(params[:id])
    @same_category_products = Product.where(category_id: @product.category_id).where.not(id:@product.id).order('created_at DESC').limit(6)
    @category=Category.all
  end

end
