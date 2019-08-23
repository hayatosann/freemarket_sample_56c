class PurchaseController < ApplicationController
  before_action :authenticate_user!
  require 'payjp'
  require 'dotenv'

  def new
    @product = Product.find(params[:product_id])
    @card = current_user.card
    @purchase =Purchase.new
    if current_user.id == @product.user_id
      redirect_to product_path(@product.id)
    end
  end
  
  
  def create
    Payjp.api_key = 'sk_test_7746d4765135cd860e791d97'
    exp_date = Date.parse(purchase_params[:expiration_date])
    exp_year = exp_date.year.to_s
    exp_month = exp_date.month.to_s
    response =  Payjp::Token.create({
      card: {
        number: purchase_params[:number], 
        cvc: purchase_params[:security_code],
        exp_month: exp_month,
        exp_year: exp_year
      }},
      {
        'X-Payjp-Direct-Token-Generate': 'true'
      } 
    )
    amount = Product.find(purchase_params[:product_id]).price
    Payjp::Charge.create(
      amount: amount, # 決済する値段
      card: response.id,
      currency: 'jpy'
    )
    Purchase.create(buyer_id: current_user.id,product_id: purchase_params[:product_id],postage_by: purchase_params[:postage_by],status: 1)
    redirect_to :root
  end

  private 
  def purchase_params
    params.require(:purchase).permit(:product_id, :postage_by, :number, :expiration_date, :security_code)
  end
  
end
