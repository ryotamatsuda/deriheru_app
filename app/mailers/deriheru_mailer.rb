class DeriheruMailer < ApplicationMailer
  default from: 'ryota12221@gmail.com'
  def welcome_operator
    @operator = params[:operator]
    mail(to: @operator.email, subject: 'デリヘルAppへようこそ')
  end
end
