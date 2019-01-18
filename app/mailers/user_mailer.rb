class UserMailer < ApplicationMailer
   default from: 'no-reply@jungle.com'

  def order_confirm_email(user, order)
    @user = user
    @order = order
    # @url  = 'http://example.com/login'
    mail(to: @order.email, subject: 'Your JungleApp Order #@order.id has been placed!')
  end
end
