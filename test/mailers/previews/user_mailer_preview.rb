class UserMailerPreview < ActionMailer::Preview
  def order_confirm_email
    UserMailer.order_confirm_email(User.last, Order.last)
  end
end