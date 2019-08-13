class ProductsController < ApplicationController
  def new
    @product = Product.new
    @parents = Category.all.order("id ASC").limit(13)
  end

  def create
    @product = Product.create
    @product.user_id = current_user.id
    @product.save!
  end
  
  def index
  end
  
  def show
  end

end
