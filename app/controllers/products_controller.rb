class ProductsController < ApplicationController
  def index
    @products = Product.order(id: :desc).limit(4)
  end
  
  def new
  end
  
  def show
  end

  def product_parmit
    params.require(:product).parmit(:name, :price)
  end
end
