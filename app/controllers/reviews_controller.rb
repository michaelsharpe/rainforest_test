class ReviewsController < ApplicationController
  before_filter :load_product

  def show
    @review = Review.find(params[:id])
  end

  def create
    @review = @product.reviews.build(review_params)
    #this is where we set the foreign key into the review database
    @review.user_id = current_user.id

    if @review.save
      redirect_to product_path(@product), notice: "Review created successfully."
    else
      render :action => :show
    end
  end

  def edit
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
    @review.destroy
    redirect_to product_path(@product)
  end

  private
  def review_params
    params.require(:review).permit(:comment, :product_id)
  end

  def load_product
    @product = Product.find(params[:product_id])    
  end
end
