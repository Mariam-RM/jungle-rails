class ReviewsController < ApplicationController
  before_filter :authorize

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.product_id = params[:product_id]

    if @review.save
      redirect_to "/"
     else
      redirect_to "/products/#{params[:product_id]}"
    end

  end

  def destroy
    r = Review.find(params[:id])
    r.destroy
    redirect_to "/products/#{params[:product_id]}"
  end


  private
    def review_params
      params[:product].require(:reviews).permit(:rating, :description)
    end

end