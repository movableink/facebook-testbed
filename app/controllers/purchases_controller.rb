class PurchasesController < ApplicationController
  def create
    @purchase = Purchase.new(params[:purchase])

    if @purchase.save
      redirect_to @purchase.product
    else
      flash[:error] = "Could not purchase."
      redirect_to @purchase.product
    end
  end

  def destroy
    @purchase = Purchase.find params[:id]

    @product = @purchase.product
    if @purchase.destroy
      redirect_to @product
    else
      flash[:error] = "Could not return."
      redirect_to @purchase.product
    end
  end
end
