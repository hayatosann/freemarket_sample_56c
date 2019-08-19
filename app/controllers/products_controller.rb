class ProductsController < ApplicationController
  def new
    @product = Product.new
    @product.images.build
    @parents = Category.all.order("id ASC").limit(13)
  end

  def create
    @product = Product.new(product_params)
    @product.user_id = 1  #ログイン機能がついているマスターブランチをプルするまでの仮の値を入れています
    @product.size_id = 1  #非同期通信でのフォーム実装が完了するまで仮の値を入れています
    @product.brand_id = 1  #非同期通信でのフォーム実装が完了するまで仮の値を入れています
    @product.shipping_method_id = 4   #非同期通信でのフォーム実装が完了するまで仮の値を入れています
    if @product.save
      params[:images][:image].each do |image|
        @product.images.create(image: image, product_id: @product.id)
      end
      redirect_to root_path
    else
      render :new
    end
  end
    
  def index
    @products = Product.order(id: :desc).limit(4)
  end
  
  def show
    @product = Product.find(params[:id])
    @first_product=Product.first
    @last_product=Product.last
    @same_category_products = Product.where(category_id: @product.category_id).where.not(id:@product.id).order('created_at DESC').limit(6)
    @category=Category.all
  end


  def search
    if params[:search]
      @products = Product.where('name LIKE ?', "%#{params[:search]}%").page(params[:page]).per(132).order('updated_at DESC')
      @keyword = params[:search]
      @search_count = Product.where('name LIKE ?', "%#{params[:search]}%").size
    else
      @products = Product.page(params[:page]).per(132).order('updated_at DESC')
    end
  end
  
  private

  def product_params
    params.require(:product).permit(:id,:name,:detail,:user_id,:size_id,:brand_id,:condition_id,:delivery_fee_id,:shipping_method,:prefecture_from_id,:shipping_days_id,:price,:category_id,images_attributes: [:image])
  end

end