class ReviewsController < ApplicationController

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

  private
    def review_params
      params[:product].require(:reviews).permit(:rating, :description)
    end

 #  def create
 #    @review = Review.new(review_params)
 #    @review.user_id = session[:user_id]

 #    if @review.valid?

 #     @review.save!
 #      # redirect_to '/', notice: 'Your review has been added'
 #    else

 #      redirect_to '/login', notice: 'your review has not been added'

 #    end


 # end


 #  private

 #  # def create_review
 #  #   review = Review.new (
 #  #     product_id: params[:product_id],
 #  #     user_id: current_user,
 #  #     description: "I like this" ,
 #  #     rating: "5"
 #  #   )
 #  # end

 #  #   review
 #  # end
 #    def review_params
 #      params[:product].require(:reviews).permit(:product_id,:description, :rating)
 #    end
end


  # order = Order.new(
  #     email: params[:stripeEmail],
  #     total_cents: cart_subtotal_cents,
  #     stripe_charge_id: stripe_charge.id, # returned by stripe
  #   )

# params.require(:user).permit(:name, :email, :password, :password_confirmation)

  # t.integer  "product_id"
  #   t.integer  "user_id"
  #   t.text     "description"
  #   t.integer  "rating"