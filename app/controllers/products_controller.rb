class ProductsController < ApplicationController
  def show
    @product = Product.find params[:id]

    @friends = current_user.friends_who_purchased(@product)
  end

  def movable_ink
    @product = Product.find params[:id]
    @user = User.find_by_uid params[:user]

    if @user.nil?
      render :nothing => true
    else
      @friends = @user.friends_who_purchased(@product)
      render :layout => false
    end
  end
end
