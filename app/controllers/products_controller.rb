class ProductsController < ApplicationController

  def index
    @products = Product.order(id: :desc).limit(4)
  end
  
  def new
  end
  
  def show
  end

  def search
    if params[:search]
      @products = Product.where('name LIKE ?', "%#{params[:search]}%").page(params[:page]).per(132).order('updated_at DESC')
    else
      @products = Product.page(params[:page]).per(132).order('updated_at DESC')
    end
  end
  
  
  private

  def product_permit
    params.require(:product).permit(:id, :name, :price)
  end


end

