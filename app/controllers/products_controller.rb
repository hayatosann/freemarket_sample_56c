class ProductsController < ApplicationController
  def new
    @product = Product.new
    @product.images.build
    @parents = Category.all.order("id ASC").limit(13)
  end

  def create
    @product = Product.create(product_params)
    @product.user_id = 1  #ログイン機能がついているマスターブランチをプルするまでの仮の値を入れています
    @product.size_id = 1  #非同期通信でのフォーム実装が完了するまで仮の値を入れています
    @product.brand_id = 1  #非同期通信でのフォーム実装が完了するまで仮の値を入れています
    @product.shipping_method_id = 4   #非同期通信でのフォーム実装が完了するまで仮の値を入れています
    @product.save!
  end

  def index
    @products = Product.order(id: :desc).limit(4)
  end
  
  def show
  end


#  def search
#    if params[:search]
#      @products = Product.where('name LIKE ?', "%#{params[:search]}%").page(params[:page]).per(132).order('updated_at DESC')
#      @keyword = params[:search]
#      @search_count = Product.where('name LIKE ?', "%#{params[:search]}%").size
#    else
#      @products = Product.page(params[:page]).per(132).order('updated_at DESC')
#   end

  def search
    if params[:q].present?
      @search = Product.ransack(search_params)
      @products = @search.result.page(params[:page]).per(132)
    else
      params[:q] = { sorts: 'id desc' }
      @search = Product.ransack()
      @products = Product.all.page(params[:page]).per(132)
    end
  end
  

  private

  def product_params
    params.require(:product).permit(:id,:name,:detail,:user_id,:size_id,:brand_id,:condition_id,:delivery_fee_id,:shipping_method,:prefecture_from_id,:shipping_days_id,:price,:category_id,images_attributes:[:image])
  end
  
  def search_params
    params.require(:q).permit(:sorts,:name_cont,:brand_name_cont,:price_gteq,:price_lteq)
  end
end


