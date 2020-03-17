class ServiceReminderMailer < ApplicationMailer
  default from: 'notifications@sandboxc85263fd6b934cb39c7dcf66e36eabb4.mailgun.org'

  def welcome_email(car)
    @car = car
    @url = 'http://wykop.pl'

    mail(to: @car.email, subject: 'Przypomnienie o przeglądzie')
  end
end
